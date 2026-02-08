import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestQuotationViewModel extends GetxController {
  // Mock Data
  final designImage = 'assets/images/product_ruby_vintage.jpg'.obs;
  final designTitle = 'Royal Sapphire Ring'.obs;
  final designId = '#AI-9283-GEN'.obs;

  // Form Controllers
  late TextEditingController notesController;
  late TextEditingController budgetController;
  late TextEditingController ringSizeController;

  // State
  final selectedMaterialIndex = 0.obs;
  final materials = ['18k White Gold', '14k Gold', 'Platinum', 'Silver'];

  @override
  void onInit() {
    super.onInit();
    notesController = TextEditingController();
    budgetController = TextEditingController(text: '\$1,000 - \$2,500');
    ringSizeController = TextEditingController(text: 'Size 7');
  }

  @override
  void onClose() {
    notesController.dispose();
    budgetController.dispose();
    ringSizeController.dispose();
    super.onClose();
  }

  void selectMaterial(int index) {
    selectedMaterialIndex.value = index;
  }

  void goBack() {
    Get.back();
  }

  void onSubmitRequest() {
    // Validate and submit
    Get.snackbar(
      'Request Submitted',
      'Your quotation request for $designTitle has been sent successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFBA7A60),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }
}
