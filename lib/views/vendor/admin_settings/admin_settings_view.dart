import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/admin_settings_view_model.dart';

class AdminSettingsView extends GetView<AdminSettingsViewModel> {
  const AdminSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            shape: BoxShape.circle,
            border: Border.all(color: context.theme.dividerColor.withOpacity(0.1)),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: context.textTheme.bodyLarge?.color, size: 20),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: context.textTheme.bodyLarge?.color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 40,
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              shape: BoxShape.circle,
              border: Border.all(color: context.theme.dividerColor.withOpacity(0.1)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: context.theme.cardColor, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(controller.userImage.value),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFFC48B75), // Muted terracotta color from screenshot
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Obx(() => Text(
                    controller.userName.value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.textTheme.bodyLarge?.color,
                    ),
                  )),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: context.theme.dividerColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(() => Text(
                      controller.userRole.value,
                      style: TextStyle(
                        fontSize: 14,
                        color: context.textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Account & Security Section
            _buildSectionHeader(context, 'ACCOUNT & SECURITY'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.theme.dividerColor.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: controller.onPersonalInfo,
                  ),
                  _buildDivider(context),
                  _buildSettingItem(
                    context,
                    icon: Icons.lock_outline,
                    title: 'Change Password',
                    onTap: controller.onChangePassword,
                  ),
                  _buildDivider(context),
                  Obx(() => _buildSettingItem(
                    context,
                    icon: Icons.security_outlined,
                    title: 'Two-Factor Auth',
                    subtitle: controller.isTwoFactorEnabled.value ? 'Enabled' : 'Disabled',
                    onTap: controller.onTwoFactorAuth,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // System Preferences Section
            _buildSectionHeader(context, 'SYSTEM PREFERENCES'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.theme.dividerColor.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingItem(
                    context,
                    icon: Icons.notifications_none_outlined,
                    title: 'Notifications',
                    onTap: controller.onNotifications,
                  ),
                  _buildDivider(context),
                  Obx(() => _buildSettingItem(
                    context,
                    icon: Icons.language_outlined,
                    title: 'Language',
                    subtitle: controller.selectedLanguage.value,
                    onTap: controller.onLanguage,
                  )),
                  _buildDivider(context),
                  Obx(() => _buildSettingItem(
                    context,
                    icon: Icons.palette_outlined,
                    title: 'Theme',
                    subtitle: controller.selectedTheme.value,
                    onTap: controller.onTheme,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Log Out Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextButton(
                onPressed: controller.onLogOut,
                style: TextButton.styleFrom(
                  backgroundColor: context.theme.colorScheme.errorContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: context.theme.colorScheme.error,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: context.textTheme.bodyMedium?.color?.withOpacity(0.6),
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.theme.dividerColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: context.textTheme.bodyMedium?.color,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: context.textTheme.bodyLarge?.color,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: context.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context.textTheme.bodyMedium?.color?.withOpacity(0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.theme.dividerColor.withOpacity(0.1),
      indent: 72, // Align with text start (16 padding + 40 icon + 16 gap)
    );
  }
}
