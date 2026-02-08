import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class AdminDashboardViewModel extends GetxController {
  // Stats Data
  final stats = [
    {
      'title': 'Total Users',
      'value': '2,543',
      'color': 0xFFF5F5F5, // Light Grey
      'iconColor': 0xFFE0E0E0,
      'icon': Icons.people_outline,
    },
    {
      'title': 'Design Requests',
      'value': '856',
      'color': 0xFFF5F5F5,
      'iconColor': 0xFFE0E0E0,
      'icon': Icons.design_services_outlined,
    },
    {
      'title': 'Pending Quotes',
      'value': '24',
      'color': 0xFFFFF8F0, // Light Orange/Beige
      'iconColor': 0xFFFFE4CC,
      'icon': Icons.pending_actions_outlined,
    },
    {
      'title': 'Approved Orders',
      'value': '142',
      'color': 0xFFF0FFF4, // Light Green
      'iconColor': 0xFFC8E6C9,
      'icon': Icons.check_circle_outline,
    },
  ];

  // Pending Quotations Data
  final pendingQuotations = [
    {
      'title': 'Custom Gold Solitaire',
      'user': 'Sarah Miller',
      'time': '2h ago',
      'image': 'assets/images/product_diamond_ring.jpg',
    },
    {
      'title': 'Emerald Leaf Pendant',
      'user': 'James Chen',
      'time': '5h ago',
      'image': 'assets/images/product_diamond_tennis.jpg',
    },
    {
      'title': 'Rose Floral Bracelet',
      'user': 'Emma Wilson',
      'time': '1d ago',
      'image': 'assets/images/product_pearl_bracelet.jpg',
    },
  ].obs;

  // Bottom Navigation State
  final selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void onViewAllPending() {
    // Navigate to full list (Requests Tab)
    changeTabIndex(2);
  }

  void onQuotationTap(int index) {
    // Navigate to quotation details or Send Quotation screen
    Get.toNamed(AppRoutes.sendQuotation);
  }

  void onStatTap(int index) {
    switch (index) {
      case 0: // Total Users
        Get.toNamed(AppRoutes.userManagement);
        break;
      case 1: // Design Requests
        changeTabIndex(2);
        break;
    }
  }

  void goToSettings() {
    Get.toNamed(AppRoutes.adminSettings);
  }
}
