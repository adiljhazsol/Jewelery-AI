import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class CollectionsViewModel extends GetxController {
  final _selectedIndex = 1.obs; // Default to 'Explore' tab (index 1)
  int get selectedIndex => _selectedIndex.value;

  final _selectedCategoryIndex = 0.obs;
  int get selectedCategoryIndex => _selectedCategoryIndex.value;

  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final isSearchExpanded = false.obs;

  final categories = ['All', 'Rings', 'Necklaces', 'Earrings', 'Bracelets'];

  void toggleSearch() {
    isSearchExpanded.value = !isSearchExpanded.value;
  }

  void goToMyQuotations() {
    Get.toNamed(AppRoutes.myQuotations);
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // Mock Data with Online Assets
  final allProducts = [
    {
      'id': '1',
      'category': 'RINGS',
      'name': 'Eternal Diamond',
      'price': '\$1,299',
      'image': 'assets/images/product_diamond_ring.jpg',
      'rating': 4.9,
      'reviews': 128,
      'brand': 'Tiffany & Co.',
      'description': 'A symbol of everlasting love, this Eternal Diamond ring features a brilliant-cut center stone surrounded by a halo of smaller diamonds. Set in platinum for maximum durability and shine.',
      'specs': {
        'MATERIAL': 'Platinum',
        'GEMSTONE': 'Diamond',
        'WEIGHT': '3.5 Grams',
        'STYLE': 'Engagement Ring',
      }
    },
    {
      'id': '2',
      'category': 'NECKLACES',
      'name': 'Gold Horizon',
      'price': '\$850',
      'image': 'assets/images/product_gold_necklace.jpg',
      'rating': 4.7,
      'reviews': 85,
      'brand': 'Cartier',
      'description': 'The Gold Horizon necklace captures the warmth of the setting sun. Crafted in 18k yellow gold, its minimalist bar design is perfect for layering or wearing alone as a statement piece.',
      'specs': {
        'MATERIAL': '18k Yellow Gold',
        'GEMSTONE': 'None',
        'WEIGHT': '4.2 Grams',
        'STYLE': 'Bar Necklace',
      }
    },
    {
      'id': '3',
      'category': 'EARRINGS',
      'name': 'Royal Sapphire',
      'price': '\$450',
      'image': 'assets/images/product_sapphire_earrings.jpg',
      'rating': 4.8,
      'reviews': 24,
      'brand': 'Harry Winston',
      'description': 'Exquisitely crafted deep blue sapphire studs set in 18k white gold. A timeless design that brings elegance to any occasion. Perfect for evening wear or as a sophisticated daily accessory.',
      'specs': {
        'MATERIAL': '18k White Gold',
        'GEMSTONE': 'Blue Sapphire',
        'WEIGHT': '2.4 Grams',
        'STYLE': 'Stud Earrings',
      }
    },
    {
      'id': '4',
      'category': 'BRACELETS',
      'name': 'Pure Pearl Strand',
      'price': '\$620',
      'image': 'assets/images/product_pearl_bracelet.jpg',
      'rating': 4.6,
      'reviews': 56,
      'brand': 'Mikimoto',
      'description': 'Classic elegance defined. This Pure Pearl Strand features lustrous freshwater pearls strung on high-strength silk. Finished with a 14k gold clasp for a touch of luxury.',
      'specs': {
        'MATERIAL': '14k Gold Clasp',
        'GEMSTONE': 'Freshwater Pearl',
        'WEIGHT': '15 Grams',
        'STYLE': 'Strand Bracelet',
      }
    },
    {
      'id': '5',
      'category': 'RINGS',
      'name': 'Vintage Emerald',
      'price': '\$2,100',
      'image': 'assets/images/product_emerald_ring.jpg',
      'rating': 5.0,
      'reviews': 12,
      'brand': 'Bvlgari',
      'description': 'Step back in time with this Vintage Emerald ring. A large, rectangular-cut emerald is flanked by baguette diamonds in an intricate art-deco inspired setting.',
      'specs': {
        'MATERIAL': '18k Yellow Gold',
        'GEMSTONE': 'Emerald',
        'WEIGHT': '5.1 Grams',
        'STYLE': 'Cocktail Ring',
      }
    },
    {
      'id': '6',
      'category': 'NECKLACES',
      'name': 'Rose Floral',
      'price': '\$780',
      'image': 'assets/images/product_floral_pendant.jpg',
      'rating': 4.9,
      'reviews': 45,
      'brand': 'Van Cleef & Arpels',
      'description': 'Delicate and feminine, the Rose Floral pendant features a blooming rose design sculpted in rose gold. A small diamond sits at the center for a subtle sparkle.',
      'specs': {
        'MATERIAL': '14k Rose Gold',
        'GEMSTONE': 'Diamond Accent',
        'WEIGHT': '3.0 Grams',
        'STYLE': 'Pendant',
      }
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    String category = categories[selectedCategoryIndex].toUpperCase();
    // Simple matching logic
    // Ensure product categories are consistent with filter chips (e.g. 'Rings' -> 'RINGS')
    // In a real app, use IDs or Enums
    return allProducts.where((product) {
       // Category Filter
       final productCategory = product['category'] as String?;
       bool categoryMatch = false;
       if (selectedCategoryIndex == 0) {
         categoryMatch = true;
       } else {
         if (productCategory == null) {
            categoryMatch = false;
         } else {
            categoryMatch = productCategory == category || productCategory.contains(category);
         }
       }

       // Search Filter
       final query = searchQuery.value.toLowerCase();
       if (query.isEmpty) {
         return categoryMatch;
       }
       
       final name = (product['name'] as String? ?? '').toLowerCase();
       final description = (product['description'] as String? ?? '').toLowerCase();
       
       bool searchMatch = name.contains(query) || description.contains(query);
       
       return categoryMatch && searchMatch;
    }).toList();
  }

  void changeCategory(int index) {
    _selectedCategoryIndex.value = index;
  }

  void changeTabIndex(int index) {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed(AppRoutes.home);
        break;
      case 1:
        // Already on Collections
        break;
      case 2:
        // AI Design
        Get.offNamed(AppRoutes.createDesign);
        break;
      case 3:
        // Profile
        Get.offNamed(AppRoutes.profile);
        break;
    }
  }

  void onProductTap(String id) {
    print('Product $id tapped');
    final product = allProducts.firstWhere((p) => p['id'] == id);
    Get.toNamed(AppRoutes.productDetails, arguments: product);
  }
}
