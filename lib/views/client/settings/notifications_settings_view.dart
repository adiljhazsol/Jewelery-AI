import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/notifications_settings_view_model.dart';

class NotificationSettingsView extends GetView<NotificationSettingsViewModel> {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text(
          'Notification Settings',
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
          _buildSectionHeader('Channels'),
          const SizedBox(height: 10),
          Obx(() => _buildSwitchTile(
            title: 'Push Notifications',
            subtitle: 'Receive notifications on your device',
            value: controller.pushEnabled.value,
            onChanged: controller.togglePush,
          )),
          const SizedBox(height: 10),
          Obx(() => _buildSwitchTile(
            title: 'Email Notifications',
            subtitle: 'Receive updates via email',
            value: controller.emailEnabled.value,
            onChanged: controller.toggleEmail,
          )),

          const SizedBox(height: 30),
          _buildSectionHeader('Preferences'),
          const SizedBox(height: 10),
          Obx(() => _buildSwitchTile(
            title: 'Order Updates',
            subtitle: 'Status changes, shipping info',
            value: controller.orderUpdates.value,
            onChanged: controller.toggleOrderUpdates,
          )),
          const SizedBox(height: 10),
          Obx(() => _buildSwitchTile(
            title: 'Promotions & Offers',
            subtitle: 'Discounts, special deals',
            value: controller.promotions.value,
            onChanged: controller.togglePromotions,
          )),
          const SizedBox(height: 10),
          Obx(() => _buildSwitchTile(
            title: 'New Arrivals',
            subtitle: 'Be the first to see new collections',
            value: controller.newArrivals.value,
            onChanged: controller.toggleNewArrivals,
          )),
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

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
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
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFBA7A60),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF1A1A1A),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
