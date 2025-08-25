import 'package:box_cricket/app/constants/app_colors.dart';
import 'package:box_cricket/app/routes/app_routes.dart';
import 'package:box_cricket/app/themes/app_theme.dart';
import 'package:box_cricket/app/widgets/app_launcher.dart';
import 'package:box_cricket/app/widgets/socialmedia_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class MobHomeView extends StatelessWidget {
  final HomeController controller;
  final ThemeController themeController = Get.find<ThemeController>();

  MobHomeView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.purple,toolbarHeight: 30,),
      body: SafeArea(
        child: Stack(
          children: [
            /// Scrollable content
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 80,
              ), // leave space for button
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  children: [
                    // Container(
                    //   height: 60,
                    //   color: Colors.purple.shade700,
                      
                    // ),

                    const SizedBox(height: 20),

                    // Title
                    Text(
                      "Box Cricket Thursdays",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Time & Venue
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time: 9 PM - 11 PM",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Venue: Trophy Fighters SBR",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Poster Image
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "assets/images/box_crik.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Divider(color: AppColors.grey),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Share this on:",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SocialMediaButton(
                            assetPath: "assets/images/facebook.png",
                            platform: "facebook",
                            shareLink: "https://yourapp.com/page123",
                          ),
                          SizedBox(width: 10),
                          SocialMediaButton(
                            assetPath: "assets/images/twitter.png",
                            platform: "twitter",
                            shareLink: "https://yourapp.com/page123",
                          ),
                          SizedBox(width: 10),
                          SocialMediaButton(
                            assetPath: "assets/images/whatsapp.png",
                            platform: "whatsapp",
                            shareLink: "https://yourapp.com/page123",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact Us:",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.mail,
                                size: 22,
                                color: AppColors.grey,
                              ),
                              TextButton(
                                onPressed: () {
                                  AppLauncher.launchEmail(
                                    email: "sbhayal97@gmail.com",
                                    subject: "Hello",
                                    body:
                                        "I want to contact you regarding Box Cricket.",
                                  );
                                },
                                child: const Text(
                                  "sbhayal97@gmail.com",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.call,
                                size: 22,
                                color: AppColors.grey,
                              ),
                              TextButton(
                                onPressed: () {
                                  AppLauncher.launchPhone("7477031615");
                                },
                                child: const Text(
                                  "7477031615",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Terms & Conditions:",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Once registered, the event fee will be non-refundable or non-transferrable to any future event.\n\nYou agree to share information entered on this page with SOILS (owner of this page) and Razorpay, adhering to applicable laws.",style: TextStyle(color: AppColors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            /// Fixed button at bottom
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.userInfo);
                },
                child: const Text(
                  "NEXT",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
