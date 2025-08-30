import 'package:de_ghuma_ke/app/constants/app_colors.dart';
import 'package:de_ghuma_ke/app/helpers/validators.dart';
import 'package:de_ghuma_ke/app/widgets/app_launcher.dart';
import 'package:de_ghuma_ke/app/widgets/socialmedia_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/user_info_controller.dart';

class WebHomeView extends StatelessWidget {
  final HomeController controller;
  WebHomeView({super.key, required this.controller});

  // Reuse the same controller used on mobile
  final UserInfoController user = Get.put(UserInfoController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // LEFT: details + poster (scrollable)
              Expanded(
                flex: 2,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.sports_cricket,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Box_cricket",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Box Cricket Thursdays",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text("Time: 9 PM - 11 PM"),
                        const Text("Venue: Trophy Fighters SBR"),
                        const SizedBox(height: 20),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              "assets/images/deghumake.png",
                              height: 600, // safe because this side scrolls
                              fit: BoxFit.contain,
                            ),
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
                          child: Text(
                            "Please note that upon completion of registration, the event fee shall be strictly non-refundable and non-transferable to any future event.\n\nBy submitting your registration, you acknowledge and consent to the sharing of the information provided on this page with the event organizer and Razorpay, in compliance with all applicable data protection and privacy laws.",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // RIGHT: grey bg + centered card with scrollable form
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.grey.withOpacity(0.2),
                  child: SafeArea(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Container(
                          margin: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(30),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Payment Details",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Full Name / Email / Phone (same validators as mobile)
                                  _buildTextField(
                                    "Full Name",
                                    user.fullNameController,
                                    (v) => Validators.validateName(v),
                                    inputFormatters: [],
                                  ),
                                  _buildTextField(
                                    "Email",
                                    user.emailController,
                                    (v) => Validators.validateEmail(v),
                                    keyboardType: TextInputType.emailAddress,
                                    inputFormatters: [],
                                  ),

                                  // Inside your TextField
                                  _buildTextField(
                                    "Phone",
                                    user.phoneController,
                                    (v) => Validators.validatePhoneNumber(v),
                                    keyboardType: TextInputType.phone,
                                    maxLength: 14,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\+?[0-9]*'),
                                      ),
                                    ],
                                  ),

                                  // Dropdowns (reuse reactive state)
                                  _buildDropdown(
                                    "Choose Date",
                                    user.selectedDate,
                                    user.dates,
                                  ),
                                  _buildDropdown(
                                    "Age Group",
                                    user.selectedAgeGroup,
                                    const ["Under 18", "18-30", "30+"],
                                  ),
                                  _buildDropdown(
                                    "Your Level",
                                    user.selectedLevel,
                                    const [
                                      "Beginner",
                                      "Intermediate",
                                      "Advanced",
                                    ],
                                  ),

                                  const SizedBox(height: 16),

                                  // Quantity row (optional but useful on web)
                                  Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (user.quantity.value > 1) {
                                                  user.quantity.value--;
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                              ),
                                            ),
                                            Text(
                                              user.quantity.value.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed:
                                                  () => user.quantity.value++,
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "₹${user.price}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // Total + Pay
                                  Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total: ₹${user.totalPrice}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 16,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await user.submitData();
                                              // On web this page IS the "home", so no navigation needed.
                                              // If you still want to clear focus:
                                              FocusScope.of(context).unfocus();
                                            }
                                          },
                                          child: Text(
                                            "Pay ₹${user.totalPrice}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ----- helpers (same style as your mobile view) -----

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String? Function(String?) validator, {
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primary,
        keyboardType: keyboardType,
        validator: validator,
        maxLength: maxLength,
        inputFormatters: inputFormatters, 
        decoration: InputDecoration(
          labelText: label,
          counterText: "",
          labelStyle: TextStyle(color: AppColors.primary),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    RxString selectedValue,
    List<String> items,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(
        () => DropdownButtonFormField<String>(
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: AppColors.primary),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            if (value != null) selectedValue.value = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label cannot be empty";
            }
            return null;
          },
        ),
      ),
    );
  }
}
