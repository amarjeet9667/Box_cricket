import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  // .......... Hide Keyboard ..........
  static void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

  // .......... Show Snackbar ..........
  static void showSnackbar(String title, String message, {SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
    );
  }

  // .......... Format Date (example) ..........
  static String formatDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // .......... Validate Email (example) ..........
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // .......... Launch URL (example) ..........
  static Future<void> launchUrlInBrowser(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
