import 'package:box_cricket/app/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserInfoController extends GetxController {
  // Text Controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // Dropdown values
  var selectedDate = ''.obs;
  var selectedAgeGroup = ''.obs;
  var selectedLevel = ''.obs;

  // Dates list
  var dates = <String>[].obs;

  // Quantity
  var quantity = 1.obs;
  final price = 250;

  int get totalPrice => price * quantity.value;

  @override
  void onInit() {
    super.onInit();
    _generateNextDates();
  }

  /// Generate next 3 dates (today + next 2)
  void _generateNextDates() {
    dates.clear();
    DateTime today = DateTime.now();

    for (int i = 0; i < 3; i++) {
      DateTime nextDay = today.add(Duration(days: i));
      String formatted = DateFormat('dd MMM').format(nextDay);
      dates.add(formatted);
    }

    if (selectedDate.isEmpty && dates.isNotEmpty) {
      selectedDate.value = dates.first;
    }
  }

  /// Call this at midnight or when app resumes next day
  void refreshDates() {
    _generateNextDates();
  }

  /// Save user booking data to Firestore
  Future<void> submitData() async {
    try {
      final data = {
        "fullName": fullNameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": phoneController.text.trim(),
        "date": selectedDate.value,
        "ageGroup": selectedAgeGroup.value,
        "level": selectedLevel.value,
        "quantity": quantity.value,
        "pricePerSlot": price,
        "totalPrice": totalPrice,
        "createdAt": FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection("userBookings").add(data);

      DialogHelper.showSnackBar(title: "Success", message: "Booking saved to Firebase ✅");
    } catch (e) {
      DialogHelper.showSnackBar(title:"Error", message: e.toString());
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    // You can also schedule a check here if needed
    // For now, calling _generateNextDates() ensures correct dates on load
    _generateNextDates();
  }
}

