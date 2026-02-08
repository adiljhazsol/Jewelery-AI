import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class CreateDesignViewModel extends GetxController {
  final descriptionController = TextEditingController();
  
  final selectedJewelryType = 'Ring'.obs;
  final selectedMaterial = 'Rose Gold'.obs;
  final selectedGemstone = 'Ruby'.obs;
  final selectedStyle = 'Art Deco'.obs;

  final jewelryTypes = ['Ring', 'Necklace', 'Earrings', 'Bracelet', 'Brooch'];
  final materials = ['Gold', 'Rose Gold', 'Silver', 'Platinum'];
  final gemstones = ['Diamond', 'Sapphire', 'Ruby', 'Emerald', 'None'];
  final styles = ['Modern', 'Vintage', 'Art Deco', 'Boho', 'Minimalist'];

  // Bottom Navigation
  final selectedIndex = 2.obs; // AI Design tab index

  void changeTabIndex(int index) {
    if (index == selectedIndex.value) return;
    
    switch (index) {
      case 0:
        Get.offNamed(AppRoutes.home);
        break;
      case 1:
        Get.offNamed(AppRoutes.collections);
        break;
      case 2:
        // Already on Create Design
        break;
      case 3:
        Get.offNamed(AppRoutes.profile);
        break;
    }
    selectedIndex.value = index;
  }

  void selectJewelryType(String type) => selectedJewelryType.value = type;
  void selectMaterial(String material) => selectedMaterial.value = material;
  void selectGemstone(String gemstone) => selectedGemstone.value = gemstone;
  void selectStyle(String style) => selectedStyle.value = style;

  void onGenerateDesign() {
    // Navigate to AI Design Result or show loading
    Get.toNamed(AppRoutes.aiDesignResult);
  }

  @override
  void onClose() {
    descriptionController.dispose();
    super.onClose();
  }
}
