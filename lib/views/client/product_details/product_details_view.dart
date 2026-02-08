import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/product_details_view_model.dart';

class ProductDetailsView extends GetView<ProductDetailsViewModel> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeColor = const Color(0xFFBA7A60);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Full Screen Image Slider (Background)
          // Extending to full height or partial height depending on design.
          // Screenshot shows image takes up top half.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.6, // Give it plenty of space
            child: Obx(() => PageView.builder(
              itemCount: controller.images.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                return Image.asset(
                  controller.images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.white)),
                  ),
                );
              },
            )),
          ),

          // 2. Navigation & Action Icons Overlay (Top)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircularIconBtn(
                  icon: Icons.arrow_back,
                  onTap: controller.goBack,
                ),
                _buildCircularIconBtn(
                  icon: Icons.share_outlined,
                  onTap: controller.onShare,
                ),
              ],
            ),
          ),

          // 3. Pagination Dots (Above Sheet)
          Positioned(
            top: size.height * 0.5 - 30,
            left: 0,
            right: 0,
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentImageIndex.value == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.currentImageIndex.value == index 
                        ? Colors.white 
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            )),
          ),

          // 4. Draggable Content Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Handle Bar
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12, bottom: 8),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),

                    // Scrollable Content
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        children: [
                          // Title and Price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Obx(() => Text(
                                  controller.product['name'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                )),
                              ),
                              Obx(() => Text(
                                controller.product['price'] ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1A1A),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Rating
                          Row(
                            children: [
                              ...List.generate(5, (index) {
                                // Simple star logic
                                double rating = controller.product['rating'] ?? 0.0;
                                return Icon(
                                  index < rating.floor() ? Icons.star : Icons.star_border,
                                  color: const Color(0xFFEFA926), // Gold star color
                                  size: 18,
                                );
                              }),
                              const SizedBox(width: 8),
                              Obx(() => Text(
                                '${controller.product['rating']} (${controller.product['reviews']} Reviews)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Description
                          Obx(() => Text(
                            controller.product['description'] ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.6,
                            ),
                          )),
                          const SizedBox(height: 32),

                          // Product Details Section
                          const Text(
                            'Product Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Obx(() {
                            final specs = controller.product['specs'] as Map<String, dynamic>? ?? {};
                            return GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: 2.5,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              children: specs.entries.map((e) => _buildSpecCard(e.key, e.value)).toList(),
                            );
                          }),
                          const SizedBox(height: 32),

                          // Gallery Section
                          const Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 100,
                            child: Obx(() => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.galleryImages.length,
                              separatorBuilder: (context, index) => const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    controller.galleryImages[index],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            )),
                          ),
                          const SizedBox(height: 100), // Bottom padding for buttons
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          
          // 5. Fixed Bottom Buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      // Chat Button
                      Expanded(
                        flex: 1,
                        child: OutlinedButton.icon(
                          onPressed: controller.onChat,
                          icon: const Icon(Icons.chat_bubble_outline, size: 20),
                          label: const Text('Chat'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF1A1A1A),
                            side: const BorderSide(color: Color(0xFFE0E0E0)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Request Quote Button
                      Expanded(
                        flex: 2, // Larger width
                        child: ElevatedButton(
                          onPressed: controller.onRequestQuotation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Request Quote',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIconBtn({required IconData icon, required VoidCallback onTap, Color color = Colors.black}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8), // Slightly translucent
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }

  Widget _buildSpecCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[500],
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
