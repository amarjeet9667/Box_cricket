
import 'package:box_cricket/app/utils/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkChecker extends GetxController {
  var isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();
  RxBool _isDialogShown = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkNetworkStatus();
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> _checkNetworkStatus() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    bool hasConnection = results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet,
    );

    isConnected.value = hasConnection;

    if (!hasConnection && !_isDialogShown.value) {
      _showNoInternetDialog();
    } else if (hasConnection && _isDialogShown.value) {
      Get.back(); // Close the dialog
      _isDialogShown.value = false;
      AppLogger.info("✅ Internet Connected");
    }
  }

  void _showNoInternetDialog() {
    _isDialogShown.value = true;
    AppLogger.warning("⚠️ No Internet Connection");

    Get.dialog(
      WillPopScope(
        onWillPop: () async => false, // Prevent dialog from closing manually
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.wifi_off, size: 60, color: Colors.redAccent),
                SizedBox(height: 20),
                Text(
                  "No Internet Connection",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Please check your internet settings and try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
