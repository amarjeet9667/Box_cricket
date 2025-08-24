import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  final String assetPath; // Icon image
  final String platform;  // "facebook", "whatsapp", "twitter"
  final String shareLink; // Page link to share

  const SocialMediaButton({
    super.key,
    required this.assetPath,
    required this.platform,
    required this.shareLink,
  });

  Future<void> _launchApp() async {
    String appUrl = "";
    String playStoreUrl = "";

    switch (platform.toLowerCase()) {
      case "facebook":
        appUrl = "fb://facewebmodal/f?href=$shareLink";
        playStoreUrl = "https://play.google.com/store/apps/details?id=com.facebook.katana";
        break;
      case "whatsapp":
        appUrl = "whatsapp://send?text=$shareLink";
        playStoreUrl = "https://play.google.com/store/apps/details?id=com.whatsapp";
        break;
      case "twitter":
        appUrl = "twitter://post?message=$shareLink";
        playStoreUrl = "https://play.google.com/store/apps/details?id=com.twitter.android";
        break;
      default:
        throw "Platform not supported";
    }

    final Uri appUri = Uri.parse(appUrl);

    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback to Play Store
      final Uri storeUri = Uri.parse(playStoreUrl);
      if (await canLaunchUrl(storeUri)) {
        await launchUrl(storeUri, mode: LaunchMode.externalApplication);
      } else {
        throw "Could not launch $playStoreUrl";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchApp,
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(assetPath),
      ),
    );
  }
}
