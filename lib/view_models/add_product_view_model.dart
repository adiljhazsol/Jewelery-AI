import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductViewModel extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  final RxString selectedCategory = ''.obs;
  final RxString selectedMaterial = ''.obs;
  final RxString imagePath = ''.obs;
  final RxBool isEditMode = false.obs;
  final RxString pageTitle = 'Add New Jewelry'.obs;

  final List<String> categories = ['Rings', 'Necklaces', 'Earrings', 'Bracelets', 'Pendants'];
  final List<String> materials = ['Gold', 'Silver', 'Platinum', 'Rose Gold', 'Diamond'];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      final product = Get.arguments as Map<String, dynamic>;
      nameController.text = product['name'] ?? '';
      priceController.text = product['price']?.replaceAll('\$', '') ?? ''; // Remove $ sign
      // descriptionController.text = product['description'] ?? ''; // Add description if available
      
      // Handle dropdowns - ensure value exists in list or default to empty
      if (categories.contains(product['category'])) {
        selectedCategory.value = product['category'];
      }
      if (materials.contains(product['material'])) {
        selectedMaterial.value = product['material'];
      }
      
      imagePath.value = product['image'] ?? '';
      
      isEditMode.value = true;
      pageTitle.value = 'Edit Product';
    }
  }

  void onImageUpload() {
    // Simulate image upload
    // In a real app, this would use image_picker
    print('Image upload tapped');
    imagePath.value = 'uploaded'; // Set a flag to show UI change if needed
  }

  void onSaveProduct() {
    if (validateForm()) {
      Get.snackbar(
        'Success', 
        isEditMode.value ? 'Product updated successfully' : 'Product saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFBA7A60),
        colorText: Colors.white,
      );
      // Navigate back or clear form
      Get.back();
    } else {
      Get.snackbar(
        'Error', 
        'Please fill all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  bool validateForm() {
    return nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        selectedCategory.value.isNotEmpty &&
        selectedMaterial.value.isNotEmpty;
  }

  void onNavigateHome() {
    // Navigate to Home
  }

  void onNavigateProducts() {
    // Already on Products
  }

  void onNavigateRequests() {
    // Navigate to Requests
  }

  void onNavigateChat() {
    // Navigate to Chat
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
