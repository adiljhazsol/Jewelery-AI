import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class AdminLoginViewModel extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController(text: 'admin@studio9.com');
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onSignIn() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Get.snackbar(
        'Success',
        'Logged in as Admin',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFBA7A60),
        colorText: Colors.white,
      );
      // Navigate to Admin Dashboard (future implementation)
      Get.offAllNamed(AppRoutes.adminDashboard); 
      // For now, we can navigate to Send Quotation as a vendor task example
      // Get.toNamed(AppRoutes.sendQuotation);
    } else {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  void onReturnToCustomerApp() {
    Get.offAllNamed(AppRoutes.login);
  }
}
