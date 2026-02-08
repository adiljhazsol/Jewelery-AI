import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/models/order.dart';
import 'package:jewelry_ai/view_models/order_history_view_model.dart';

class OrderHistoryView extends GetView<OrderHistoryViewModel> {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1A1A1A), size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: controller.orders.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return _buildOrderCard(order);
          },
        ),
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              order.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${order.orderId}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  order.date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                _buildStatusBadge(order.status),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case OrderStatus.quotationReceived:
        bgColor = const Color(0xFFFFF4E5); // Light Orange
        textColor = const Color(0xFFE65100); // Dark Orange
        text = 'Quotation Received';
        break;
      case OrderStatus.inProduction:
        bgColor = const Color(0xFFE3F2FD); // Light Blue
        textColor = const Color(0xFF1565C0); // Dark Blue
        text = 'In Production';
        break;
      case OrderStatus.delivered:
        bgColor = const Color(0xFFE8F5E9); // Light Green
        textColor = const Color(0xFF2E7D32); // Dark Green
        text = 'Delivered';
        break;
      case OrderStatus.quotationPending:
        bgColor = const Color(0xFFF5F5F5); // Light Grey
        textColor = const Color(0xFF616161); // Dark Grey
        text = 'Quotation Pending';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
