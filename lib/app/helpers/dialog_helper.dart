import 'dart:developer';
import 'package:de_ghuma_ke/app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DialogHelper {
  // Show custom loading dialog
  static Future<void> showLoading({String? message, bool barrierDismissible = false}) async {
    await Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: PopScope(
          canPop: barrierDismissible,
          onPopInvoked: (_) async {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(),
                const SizedBox(height: 8),
                Text(message ?? 'Loading...'),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.grey.withOpacity(.2),
    );
  }

  // Hide any open dialog
  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  // Show error dialog
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Get.textTheme.headlineMedium),
              Text(description ?? '', style: Get.textTheme.titleLarge),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen ?? false) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show toast message
  static void showToast({required String message}) async {
    await Fluttertoast.showToast(msg: message);
  }

  // Show snackbar
  static void showSnackBar({String title = 'Alert!', required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Show app dialog with optional header and styling
  static Future<void> showAppDialog({
    Widget? child,
    bool barrierDismissible = false,
    bool header = false,
    String? heading,
    Color? dialogBGColor,
    BorderRadiusGeometry? borderRadius,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) async {
    log('Dialog: showAppDialog');

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (header)
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(heading ?? '', style: Get.textTheme.titleLarge),
                CloseButton(
                  color: AppColors.black,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        child ?? const SizedBox(),
      ],
    );

    await Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: Get.height * .012, vertical: Get.height * .012),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(12.0)),
        backgroundColor: dialogBGColor ?? AppColors.white,
        child: WillPopScope(
          onWillPop: () async => true,
          child: header ? content : (child ?? const SizedBox()),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.grey.withOpacity(.2),
    );
  }
}
