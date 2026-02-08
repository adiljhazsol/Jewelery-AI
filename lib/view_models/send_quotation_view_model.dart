import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendQuotationViewModel extends GetxController {
  // Request Details (Mock Data)
  final requestDetails = {
    'productName': 'Custom Gold Ring',
    'requestDate': 'Requested Oct 24, 2023',
    'customerName': 'Sarah Jenkins',
    'image': 'assets/images/product_diamond_ring.jpg', // Ring image
  }.obs;

  // Form Controllers
  late TextEditingController priceController;
  late TextEditingController timeController;
  late TextEditingController notesController;

  // Status State
  final isQuoted = false.obs; // false = Pending, true = Quoted

  @override
  void onInit() {
    super.onInit();
    priceController = TextEditingController(text: '1250.00');
    timeController = TextEditingController(text: '3 Weeks');
    notesController = TextEditingController(
      text: 'Price includes 18k gold setting and certified VS1 diamonds. Final weight may vary slightly.'
    );
  }

  @override
  void onClose() {
    priceController.dispose();
    timeController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void toggleStatus(bool quoted) {
    isQuoted.value = quoted;
  }

  void goBack() {
    Get.back();
  }

  void onReject() {
    print('Reject clicked');
    Get.snackbar(
      'Rejected',
      'Quotation request has been rejected',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[100],
      colorText: Colors.red[900],
    );
  }

  void onSendQuote() {
    print('Send Quote clicked');
    // Validate inputs if necessary
    Get.snackbar(
      'Success',
      'Quotation sent successfully to ${requestDetails['customerName']}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFBA7A60),
      colorText: Colors.white,
    );
  }
}
