import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jewelry_ai/routes/app_routes.dart';

class LoginViewModel extends GetxController {
  final emailController = TextEditingController(text: 'hello@example.com');
  final passwordController = TextEditingController(text: '........');
  
  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;

  void togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void login() {
    // Implement login logic here
    Get.offAllNamed(AppRoutes.home);
  }

  void navigateToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  void navigateToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
