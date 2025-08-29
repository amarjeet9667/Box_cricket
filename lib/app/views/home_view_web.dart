import 'package:box_cricket/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class WebHomeView extends StatelessWidget {
  final HomeController controller;
  WebHomeView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left Section (Poster & Info)
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Row(
                    children: [
                      Icon(
                        Icons.sports_cricket,
                        color: AppColors.primary,
                        size: 32,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "SOILS",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Box Cricket Thursdays",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Time: 9 PM - 11 PM"),
                  Text("Venue: Trophy Fighters SBR"),
                  SizedBox(height: 20),
      
                  // Poster Image
                  Center(
                    child: Image.asset(
                      "assets/images/deghumake.png",
                      height: 600,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          // Right Section (Form with grey background)
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // Grey Background
                Container(
                  color: AppColors.grey.withOpacity(0.2),
                  width: double.infinity,
                  height: double.infinity,
                ),
      
                // Payment Form Card
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(40),
                    padding: EdgeInsets.all(30),
                    width: 450,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Payment Details",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 20),
      
                        // Full Name
                        _buildTextField("Full Name"),
                        _buildTextField("Email"),
                        _buildTextField("Phone"),
      
                        // Dropdowns
                        _buildDropdown("Choose Date", ["22 Aug", "23 Aug"]),
                        _buildDropdown("Age Group", ["18-25", "25-40"]),
                        _buildDropdown("Your Level", [
                          "Beginner",
                          "Intermediate",
                          "Pro",
                        ]),
      
                        SizedBox(height: 20),
      
                        // Price + Pay Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹ 250.00",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                // handle payment
                              },
                              child: Text(
                                "Pay ₹ 250.00",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: items
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
