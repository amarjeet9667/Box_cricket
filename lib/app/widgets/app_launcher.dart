import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  /// Open Email
  static Future<void> launchEmail({
    required String email,
    String subject = "",
    String body = "",
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject, 'body': body},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("No email app found!");
    }
  }

  /// Open Phone Dialer
  static Future<void> launchPhone(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("No phone app found!");
    }
  }

  /// Open App (if installed) else redirect to PlayStore/AppStore
  static Future<void> launchAppOrStore({
    required String urlScheme, // deep link like fb://, twitter://
    required String storeUrl, // PlayStore / AppStore link
  }) async {
    final Uri appUri = Uri.parse(urlScheme);
    final Uri storeUri = Uri.parse(storeUrl);

    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(storeUri, mode: LaunchMode.externalApplication);
    }
  }
}
