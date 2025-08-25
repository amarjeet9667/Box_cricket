import 'package:box_cricket/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_info_controller.dart';

class UserInfoView extends StatelessWidget {
  final UserInfoController controller = Get.put(UserInfoController());

  UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Full Name", controller.phoneController),
              _buildTextField("Email", controller.phoneController),
              _buildTextField("Phone", controller.phoneController),
              _buildDropdown("Choose Date", controller.selectedDate, controller.dates),
              _buildDropdown("Age Group", controller.selectedAgeGroup, ["Under 18", "18-30", "30+"]),
              _buildDropdown("Your Level", controller.selectedLevel, ["Beginner", "Intermediate", "Advanced"]),
              const SizedBox(height: 20),
              _buildQuantitySection(),
              const SizedBox(height: 30),
              Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async{
                  // Handle payment click
                  Get.snackbar("Payment", "Proceed to pay ₹${controller.totalPrice}");
                  await controller.submitData();
                },
                child: Text("Pay ₹${controller.totalPrice}", style: const TextStyle(fontSize: 16)),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController textController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: textController,
        keyboardType: label == "Phone" ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, RxString selectedValue, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() => DropdownButtonFormField<String>(
        value: selectedValue.value.isEmpty ? null : selectedValue.value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: items.map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        )).toList(),
        onChanged: (value) {
          if (value != null) selectedValue.value = value;
        },
      )),
    );
  }

  Widget _buildQuantitySection() {
    return Obx(() => Row(
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
            Text(controller.quantity.value.toString(),
                style: const TextStyle(fontSize: 16)),
            IconButton(
              onPressed: () {
                controller.quantity.value++;
              },
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        Text("₹${controller.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ));
  }
}
