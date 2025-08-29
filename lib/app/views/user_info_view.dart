import 'package:box_cricket/app/constants/app_colors.dart';
import 'package:box_cricket/app/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_info_controller.dart';

class UserInfoView extends StatelessWidget {
  final UserInfoController controller = Get.put(UserInfoController());
  final _formKey = GlobalKey<FormState>();

  UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  "Full Name",
                  controller.fullNameController,
                  (value) => Validators.validateName(value),
                ),
                _buildTextField(
                  "Email",
                  controller.emailController,
                  (value) => Validators.validateEmail(value),
                ),
                _buildTextField(
                  "Phone",
                  controller.phoneController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number cannot be empty";
                    }
                    if (!value.startsWith("+91")) {
                      return "Phone must start with +91";
                    }
                    if (value.length != 14) {
                      return "Phone must be +91 followed by 10 digits";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  maxLength: 14
                ),

                _buildDropdown(
                  "Choose Date",
                  controller.selectedDate,
                  controller.dates,
                ),
                _buildDropdown("Age Group", controller.selectedAgeGroup, [
                  "Under 18",
                  "18-30",
                  "30+",
                ]),
                _buildDropdown("Your Level", controller.selectedLevel, [
                  "Beginner",
                  "Intermediate",
                  "Advanced",
                ]),
                const SizedBox(height: 20),
                _buildQuantitySection(),
                const SizedBox(height: 30),
                Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Payment",
                          "Proceed to pay ₹${controller.totalPrice}",
                        );
                        await controller.submitData();
                      }
                    },
                    child: Text(
                      "Pay ₹${controller.totalPrice}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController textController,
    String? Function(String?) validator, 
    {
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
  }
  
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: textController,
        cursorColor: AppColors.primary,
        keyboardType: keyboardType,
        validator: validator,
        maxLength: maxLength,
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
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
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

  Widget _buildQuantitySection() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("9 to 11pm Time", style: TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (controller.quantity.value > 1) {
                    controller.quantity.value--;
                  }
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(
                controller.quantity.value.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () {
                  controller.quantity.value++;
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          Text(
            "₹${controller.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
