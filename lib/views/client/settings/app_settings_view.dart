import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/app_settings_view_model.dart';

class AppSettingsView extends GetView<AppSettingsViewModel> {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text(
          'App Settings',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: controller.goBack,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionHeader('General'),
          const SizedBox(height: 10),
          _buildSettingsTile(
            title: 'Language',
            subtitle: controller.selectedLanguage.value,
            icon: Icons.language,
            trailing: Obx(() => DropdownButton<String>(
              value: controller.selectedLanguage.value,
              underline: const SizedBox(),
              items: ['English', 'Spanish', 'French', 'German']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: controller.updateLanguage,
            )),
          ),
          const SizedBox(height: 10),
          _buildSettingsTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark theme',
            icon: Icons.dark_mode_outlined,
            trailing: Obx(() => Switch(
              value: controller.isDarkMode.value,
              onChanged: controller.toggleTheme,
              activeColor: const Color(0xFFBA7A60),
            )),
          ),
          
          const SizedBox(height: 30),
          _buildSectionHeader('Notifications'),
          const SizedBox(height: 10),
          _buildSettingsTile(
            title: 'Notification Settings',
            subtitle: 'Manage push and email notifications',
            icon: Icons.notifications_outlined,
            onTap: controller.goToNotificationSettings,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ),

          const SizedBox(height: 30),
          _buildSectionHeader('About'),
          const SizedBox(height: 10),
          _buildSettingsTile(
            title: 'Privacy Policy',
            icon: Icons.privacy_tip_outlined,
            onTap: () {}, // Placeholder
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          _buildSettingsTile(
            title: 'Terms of Service',
            icon: Icons.description_outlined,
            onTap: () {}, // Placeholder
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          _buildSettingsTile(
            title: 'App Version',
            subtitle: '1.0.0',
            icon: Icons.info_outline,
            trailing: const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildSettingsTile({
    required String title,
    String? subtitle,
    required IconData icon,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFBA7A60).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFFBA7A60), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF1A1A1A),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              )
            : null,
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
