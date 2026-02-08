import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class AdminSettingsViewModel extends GetxController {
  final userName = 'Alexandra V.'.obs;
  final userRole = 'Super Admin'.obs;
  final userImage = 'assets/images/user_avatar.jpg'.obs;
  
  final isTwoFactorEnabled = true.obs;
  final selectedLanguage = 'English (US)'.obs;
  final selectedTheme = 'Light'.obs;

  void onLogOut() {
    Get.defaultDialog(
      title: 'Log Out',
      middleText: 'Are you sure you want to log out?',
      textConfirm: 'Log Out',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFFDC2626),
      onConfirm: () {
        Get.back(); // Close dialog
        Get.offAllNamed(AppRoutes.adminLogin);
      },
    );
  }

  void onPersonalInfo() {
    Get.toNamed(
      AppRoutes.personalInformation,
      arguments: {
        'name': userName.value,
        'email': 'admin@studio9.com', // Example email
        'phone': '+1 (555) 000-0000',
      },
    );
  }

  void onChangePassword() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    
    Get.defaultDialog(
      title: 'Change Password',
      content: Column(
        children: [
          TextField(
            controller: currentPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      textConfirm: 'Update',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFFBA7A60),
      onConfirm: () {
        // Mock update logic
        if (currentPasswordController.text.isNotEmpty && newPasswordController.text.isNotEmpty) {
           Get.back();
           Get.snackbar('Success', 'Password updated successfully', backgroundColor: Colors.green, colorText: Colors.white);
        } else {
           Get.snackbar('Error', 'Please fill all fields', backgroundColor: Colors.red, colorText: Colors.white);
        }
      },
    );
  }

  void onTwoFactorAuth() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Two-Factor Authentication',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Get.textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Secure your account with 2FA.',
              style: TextStyle(
                color: Get.textTheme.bodyMedium?.color,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => SwitchListTile(
              title: Text(
                'Enable 2FA',
                style: TextStyle(
                  color: Get.textTheme.bodyLarge?.color,
                ),
              ),
              value: isTwoFactorEnabled.value,
              activeColor: const Color(0xFFBA7A60),
              onChanged: (val) {
                isTwoFactorEnabled.value = val;
                Get.back();
                Get.snackbar('Success', '2FA ${val ? "Enabled" : "Disabled"}', backgroundColor: Colors.green, colorText: Colors.white);
              },
            )),
            const SizedBox(height: 40), // Extra padding for mobile controls
          ],
        ),
      ),
    );
  }

  void onNotifications() {
    Get.toNamed(AppRoutes.notificationSettings);
  }

  void onLanguage() {
    final languages = ['English (US)', 'Spanish', 'French', 'German', 'Chinese'];
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Language',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Get.textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 20),
            ...languages.map((lang) => ListTile(
              title: Text(
                lang,
                style: TextStyle(
                  color: Get.textTheme.bodyLarge?.color,
                ),
              ),
              trailing: selectedLanguage.value == lang ? const Icon(Icons.check, color: Color(0xFFBA7A60)) : null,
              onTap: () {
                selectedLanguage.value = lang;
                Get.back();
              },
            )),
            const SizedBox(height: 40), // Extra padding for mobile controls
          ],
        ),
      ),
    );
  }

  void onTheme() {
    final themes = ['Light', 'Dark', 'System'];
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Theme',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Get.textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 20),
            ...themes.map((theme) => ListTile(
              title: Text(
                theme,
                style: TextStyle(
                  color: Get.textTheme.bodyLarge?.color,
                ),
              ),
              trailing: selectedTheme.value == theme ? const Icon(Icons.check, color: Color(0xFFBA7A60)) : null,
              onTap: () {
                selectedTheme.value = theme;
                
                // Update app theme
                if (theme == 'Light') {
                  Get.changeThemeMode(ThemeMode.light);
                } else if (theme == 'Dark') {
                  Get.changeThemeMode(ThemeMode.dark);
                } else {
                  Get.changeThemeMode(ThemeMode.system);
                }
                
                Get.back();
              },
            )),
            const SizedBox(height: 40), // Extra padding for mobile controls
          ],
        ),
      ),
    );
  }
}
