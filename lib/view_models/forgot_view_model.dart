import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotViewModel extends GetxController {
  final emailController = TextEditingController();

  void sendResetCode() {
    // Implement password reset logic here
    Get.snackbar(
      'Reset Code',
      'Password reset code functionality not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToLogin() {
    Get.back(); // Go back to login screen
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
