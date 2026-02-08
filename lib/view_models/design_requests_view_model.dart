import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class DesignRequestsViewModel extends GetxController {
  final selectedFilter = 'All Requests'.obs;
  final filters = ['All Requests', 'New', 'In Progress'];

  final requests = [
    {
      'id': '1',
      'title': 'Custom Gold Ring',
      'customer': 'Sarah Jenkins',
      'status': 'NEW',
      'time': '10 min ago',
      'image': 'assets/images/product_diamond_ring.jpg',
    },
    {
      'id': '2',
      'title': 'Floral Necklace AI',
      'customer': 'Michael Chen',
      'status': 'PENDING',
      'time': '2 hrs ago',
      'image': 'assets/images/product_floral_pendant.jpg',
    },
    {
      'id': '3',
      'title': 'Vintage Bracelet',
      'customer': 'Emma Wilson',
      'status': 'QUOTED',
      'time': 'Yesterday',
      'image': null, // Placeholder
    },
    {
      'id': '4',
      'title': 'Diamond Stud Inquiry',
      'customer': 'David Ross',
      'status': 'QUOTED',
      'time': '2 days ago',
      'image': null, // Placeholder
    },
  ].obs;

  void setFilter(String filter) {
    selectedFilter.value = filter;
    // Implement filtering logic here if needed
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'NEW':
        return const Color(0xFFFEE2E2); // Light Red
      case 'PENDING':
        return const Color(0xFFFEF3C7); // Light Amber
      case 'QUOTED':
        return const Color(0xFFD1FAE5); // Light Green
      default:
        return Colors.grey[100]!;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'NEW':
        return const Color(0xFFDC2626); // Red
      case 'PENDING':
        return const Color(0xFFD97706); // Amber
      case 'QUOTED':
        return const Color(0xFF059669); // Green
      default:
        return Colors.grey[600]!;
    }
  }

  void onRequestTap(int index) {
    Get.toNamed(AppRoutes.sendQuotation);
  }
}
