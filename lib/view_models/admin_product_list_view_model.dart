import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class AdminProductListViewModel extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  final allProducts = <Map<String, String>>[
    {
      'id': '1',
      'name': 'Royal Sapphire Ring',
      'category': 'Rings',
      'material': 'Gold',
      'price': '\$450',
      'image': 'assets/images/product_diamond_ring.jpg',
    },
    {
      'id': '2',
      'name': 'Golden Horizon',
      'category': 'Necklaces',
      'material': '18k',
      'price': '\$890',
      'image': 'assets/images/product_gold_necklace.jpg',
    },
    {
      'id': '3',
      'name': 'Starlight Studs',
      'category': 'Earrings',
      'material': 'Diamond',
      'price': '\$1,200',
      'image': 'assets/images/product_sapphire_earrings.jpg',
    },
    {
      'id': '4',
      'name': 'Floral Cuff',
      'category': 'Bracelets',
      'material': 'Gold',
      'price': '\$650',
      'image': 'assets/images/product_pearl_bracelet.jpg',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  void editProduct(Map<String, String> product) {
    Get.toNamed(AppRoutes.addProduct, arguments: product);
  }

  void deleteProduct(String id) {
    Get.defaultDialog(
      title: 'Delete Product',
      middleText: 'Are you sure you want to delete this product?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        allProducts.removeWhere((p) => p['id'] == id);
        Get.back(); // Close dialog
        Get.snackbar(
          'Success',
          'Product deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      },
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  List<Map<String, String>> get filteredProducts {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      return allProducts;
    }
    return allProducts.where((product) {
      final name = product['name']!.toLowerCase();
      final category = product['category']!.toLowerCase();
      return name.contains(query) || category.contains(query);
    }).toList();
  }
}
