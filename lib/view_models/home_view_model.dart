import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class HomeViewModel extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  
  final isSearchExpanded = false.obs;
  final searchController = TextEditingController();

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  final categories = [
    {'name': 'Rings', 'image': 'assets/images/category_rings.jpg'},
    {'name': 'Necklaces', 'image': 'assets/images/category_necklaces.jpg'},
    {'name': 'Earrings', 'image': 'assets/images/category_earrings.jpg'},
    {'name': 'Bracelets', 'image': 'assets/images/category_bracelets.jpg'},
  ];

  // Using Unsplash images to match ProductDetailsView requirements
  final trendingDesigns = <Map<String, String>>[
    {
      'title': 'Emerald Solitaire',
      'author': 'LuxeAI',
      'image': 'assets/images/product_emerald_ring.jpg',
    },
    {
      'title': 'Floral Pendant',
      'author': 'Studio 9',
      'image': 'assets/images/product_floral_pendant.jpg',
    },
    {
      'title': 'Gold Pave Hoops',
      'author': 'Elena',
      'image': 'assets/images/product_sapphire_earrings.jpg',
    },
    {
      'title': 'Art Deco Sapphire',
      'author': 'Al Lab',
      'image': 'assets/images/product_diamond_ring.jpg',
    },
  ].obs;

  // More items to load
  final _moreDesigns = [
    {
      'title': 'Pearl Drop',
      'author': 'LuxeAI',
      'image': 'assets/images/product_pearl_drop.jpg',
    },
    {
      'title': 'Ruby Vintage',
      'author': 'GemStudio',
      'image': 'assets/images/product_ruby_vintage.jpg',
    },
    {
      'title': 'Silver Cuff',
      'author': 'ModernArt',
      'image': 'assets/images/product_pearl_bracelet.jpg',
    },
    {
      'title': 'Diamond Tennis',
      'author': 'Brilliance',
      'image': 'assets/images/product_diamond_tennis.jpg',
    },
  ];

  final hasMoreData = true.obs;
  final isLoadingMore = false.obs;

  void changeTabIndex(int index) {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        // Already on Home
        break;
      case 1:
        Get.offNamed(AppRoutes.collections);
        break;
      case 2:
        // AI Design
        Get.toNamed(AppRoutes.createDesign);
        break;
      case 3:
        // Profile
        Get.offNamed(AppRoutes.profile);
        break;
    }
  }

  void onSeeAllCategories() {
    // Navigate to Collections or Categories screen
    Get.toNamed(AppRoutes.collections);
  }

  void onCategoryTap(String categoryName) {
    Get.toNamed(AppRoutes.collections, arguments: categoryName);
  }

  void onGenerateDesign() {
    Get.toNamed(AppRoutes.createDesign);
  }

  void onSearch() {
    isSearchExpanded.value = !isSearchExpanded.value;
  }

  void onNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }

  void onTrendingItemTap(int index) {
    print('Trending item $index tapped');
    final item = trendingDesigns[index];
    Get.toNamed(AppRoutes.productDetails, arguments: {
      'name': item['title'],
      'author': item['author'],
      'image': item['image'],
      'price': '\$1,250',
      'description': 'An exquisite design from our trending collection.',
    });
  }

  Future<void> onLoadMore() async {
    if (!hasMoreData.value || isLoadingMore.value) return;

    isLoadingMore.value = true;
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Add more items
    trendingDesigns.addAll(_moreDesigns);
    
    // In this mock implementation, we only have one batch of extra data
    hasMoreData.value = false;
    isLoadingMore.value = false;
  }
}
