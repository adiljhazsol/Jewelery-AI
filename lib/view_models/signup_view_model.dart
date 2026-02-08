import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class SignupViewModel extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;

  void togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void signup() {
    // Implement signup logic here
    Get.offAllNamed(AppRoutes.home);
  }

  void navigateToLogin() {
    Get.back(); // Go back to login screen
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
