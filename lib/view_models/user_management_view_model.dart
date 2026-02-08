import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementViewModel extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString selectedFilter = 'All Users'.obs;
  final RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredUsers = <Map<String, dynamic>>[].obs;

  final List<String> filters = ['All Users', 'Active', 'Pending Review', 'Inactive'];

  @override
  void onInit() {
    super.onInit();
    loadUsers();
    
    // Listen to search and filter changes
    searchController.addListener(_filterList);
    ever(selectedFilter, (_) => _filterList());
  }

  void loadUsers() {
    users.value = [
      {
        'name': 'Sarah Jenkins',
        'email': 'sarah.j@example.com',
        'status': 'ACTIVE',
        'requests': 5,
        'orders': 2,
        'spent': '\$1.2k',
        'image': 'assets/images/user_avatar.jpg',
      },
      {
        'name': 'Raj Patel',
        'email': 'raj.designs@example.com',
        'status': 'PENDING',
        'requests': 1,
        'orders': 0,
        'spent': '\$0',
        'image': 'assets/images/user_avatar.jpg',
      },
      {
        'name': 'Mei Ling',
        'email': 'mei.ling99@example.com',
        'status': 'ACTIVE',
        'requests': 8,
        'orders': 3,
        'spent': '\$4.5k',
        'image': 'assets/images/user_avatar.jpg',
      },
      {
        'name': 'Robert Stone',
        'email': 'rob.stone@company.com',
        'status': 'INACTIVE',
        'requests': 2,
        'orders': 1,
        'spent': '\$350',
        'image': 'assets/images/user_avatar.jpg',
      },
    ];
    _filterList();
  }

  void _filterList() {
    String query = searchController.text.toLowerCase();
    String filter = selectedFilter.value;

    filteredUsers.value = users.where((user) {
      bool matchesSearch = user['name'].toString().toLowerCase().contains(query) ||
          user['email'].toString().toLowerCase().contains(query);
      
      bool matchesFilter = true;
      if (filter == 'Active') {
        matchesFilter = user['status'] == 'ACTIVE';
      } else if (filter == 'Pending Review') {
        matchesFilter = user['status'] == 'PENDING';
      } else if (filter == 'Inactive') {
        matchesFilter = user['status'] == 'INACTIVE';
      }

      return matchesSearch && matchesFilter;
    }).toList();
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void onHistory(Map<String, dynamic> user) {
    // Navigate to user history
    print('View history for ${user['name']}');
  }

  void onViewRequests(Map<String, dynamic> user) {
    // Navigate to user requests
    print('View requests for ${user['name']}');
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
