import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/send_quotation_view_model.dart';

class SendQuotationView extends GetView<SendQuotationViewModel> {
  const SendQuotationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
          ),
          onPressed: controller.goBack,
        ),
        title: const Text(
          'Send Quotation',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // REQUEST DETAILS Section
            const Text(
              'REQUEST DETAILS',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Obx(() => Image.asset(
                      controller.requestDetails['image']!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported),
                      ),
                    )),
                  ),
                  const SizedBox(width: 16),
                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                          controller.requestDetails['productName']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        )),
                        const SizedBox(height: 4),
                        Obx(() => Text(
                          controller.requestDetails['requestDate']!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[500],
                          ),
                        )),
                        const SizedBox(height: 8),
                        Obx(() => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            controller.requestDetails['customerName']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // QUOTATION DETAILS Section
            const Text(
              'QUOTATION DETAILS',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 16),
            
            // Price Estimate
            const Text(
              'Price Estimate',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.priceController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money, size: 20, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFFFFFBF9), // Very light background
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFBA7A60)),
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Estimated Delivery Time
            const Text(
              'Estimated Delivery Time',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.timeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFFBF9),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFBA7A60)),
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Status Update
            const Text(
              'Status Update',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Obx(() => GestureDetector(
                    onTap: () => controller.toggleStatus(false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: !controller.isQuoted.value ? Colors.white : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: !controller.isQuoted.value ? Colors.grey[300]! : Colors.grey[200]!,
                          width: !controller.isQuoted.value ? 1.5 : 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Pending',
                          style: TextStyle(
                            color: !controller.isQuoted.value ? Colors.grey[800] : Colors.grey[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Obx(() => GestureDetector(
                    onTap: () => controller.toggleStatus(true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: controller.isQuoted.value ? const Color(0xFF1A1A1A) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: controller.isQuoted.value 
                            ? null 
                            : Border.all(color: Colors.grey[200]!),
                      ),
                      child: Center(
                        child: Text(
                          'Quoted',
                          style: TextStyle(
                            color: controller.isQuoted.value ? Colors.white : Colors.grey[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Admin Notes
            const Text(
              'Admin Notes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.notesController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFFBF9),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFBA7A60)),
                ),
              ),
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
            
            // Bottom Buttons
            const SizedBox(height: 40),
            SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.onReject,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFBEAEA),
                        foregroundColor: const Color(0xFFA94442),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Reject',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.onSendQuote,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBA7A60),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Send Quote',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
