import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationViewModel extends GetxController {
  // Personal Info Controllers
  final nameController = TextEditingController(text: 'Jessica Anderson');
  final emailController = TextEditingController(text: 'jessica.anderson@example.com');
  final phoneController = TextEditingController(text: '+1 (555) 123-4567');

  // Password Controllers
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable states
  final isLoading = false.obs;
  final obscureCurrentPassword = true.obs;
  final obscureNewPassword = true.obs;
  final obscureConfirmPassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map<String, dynamic>;
      if (args.containsKey('name')) nameController.text = args['name'];
      if (args.containsKey('email')) emailController.text = args['email'];
      if (args.containsKey('phone')) phoneController.text = args['phone'];
    }
  }

  void toggleCurrentPasswordVisibility() => obscureCurrentPassword.toggle();
  void toggleNewPasswordVisibility() => obscureNewPassword.toggle();
  void toggleConfirmPasswordVisibility() => obscureConfirmPassword.toggle();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void saveChanges() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Name and Email are required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    if (newPasswordController.text.isNotEmpty) {
      if (currentPasswordController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Please enter your current password to set a new one',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
        return;
      }
      if (newPasswordController.text != confirmPasswordController.text) {
        Get.snackbar(
          'Error',
          'New passwords do not match',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
        return;
      }
      if (newPasswordController.text.length < 6) {
        Get.snackbar(
          'Error',
          'Password must be at least 6 characters',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
        return;
      }
    }

    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // Clear password fields on success
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );
  }

  void goBack() {
    Get.back();
  }
}
