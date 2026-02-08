import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/my_quotations_view_model.dart';

class MyQuotationsView extends GetView<MyQuotationsViewModel> {
  const MyQuotationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Light grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Quotations',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.filters.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Obx(() {
                  final isSelected = controller.selectedFilterIndex.value == index;
                  return GestureDetector(
                    onTap: () => controller.changeFilter(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFBA7A60) : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: isSelected 
                            ? null 
                            : Border.all(color: Colors.grey[300]!),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[600],
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),

          // Quotation List
          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: controller.filteredQuotations.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = controller.filteredQuotations[index];
                return _buildQuotationCard(item);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildQuotationCard(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Section: Image + Info + Badge
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported, size: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildStatusBadge(item['status']!),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Req ID: #${item['id']} • ${item['date']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Divider(height: 1, color: Colors.grey[200]),

          // Bottom Section: Quote Info + Action
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      item['footerLabel'] ?? 'Quote:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item['footerValue']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.find<MyQuotationsViewModel>().onActionTap(item['id']!),
                  child: Text(
                    item['actionText']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color text;
    
    switch (status) {
      case 'RECEIVED':
        bg = const Color(0xFFE3F2FD); // Light Blue
        text = const Color(0xFF1976D2); // Blue
        break;
      case 'SUBMITTED':
        bg = const Color(0xFFFFF3E0); // Light Orange
        text = const Color(0xFFF57C00); // Orange
        break;
      case 'APPROVED':
        bg = const Color(0xFFE8F5E9); // Light Green
        text = const Color(0xFF388E3C); // Green
        break;
      case 'REJECTED':
        bg = const Color(0xFFFFEBEE); // Light Red
        text = const Color(0xFFD32F2F); // Red
        break;
      default:
        bg = Colors.grey[200]!;
        text = Colors.grey[800]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: text,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
