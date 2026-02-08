import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class AppSettingsViewModel extends GetxController {
  final isDarkMode = false.obs;
  final selectedLanguage = 'English'.obs;
  final notificationsEnabled = true.obs;

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    // In a real app, save this preference
  }

  void updateLanguage(String? value) {
    if (value != null) {
      selectedLanguage.value = value;
      // In a real app, update locale
    }
  }

  void goToNotificationSettings() {
    Get.toNamed(AppRoutes.notificationSettings);
  }

  void goBack() {
    Get.back();
  }
}
