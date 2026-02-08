import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailsViewModel extends GetxController {
  final RxMap<String, dynamic> product = <String, dynamic>{}.obs;

  final isFavorite = false.obs;
  final currentImageIndex = 0.obs;

  // Blue Sapphire Earring Images
  final images = [
    'assets/images/product_sapphire_earrings.jpg',
    'assets/images/product_diamond_ring.jpg',
    'assets/images/product_sapphire_earrings.jpg',
  ].obs;
  
  // Gallery images (can be same or different)
  final galleryImages = [
     'assets/images/product_sapphire_earrings.jpg',
     'assets/images/product_diamond_ring.jpg',
     'assets/images/product_sapphire_earrings.jpg',
     'assets/images/product_diamond_ring.jpg',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // Default Data matching "Royal Sapphire" screenshot
    product.value = {
      'name': 'Royal Sapphire',
      'price': '\$450',
      'rating': 4.8,
      'reviews': 24,
      'description': 'Exquisitely crafted deep blue sapphire studs set in 18k white gold. A timeless design that brings elegance to any occasion. Perfect for evening wear or as a sophisticated daily accessory.',
      'specs': {
        'MATERIAL': '18k White Gold',
        'GEMSTONE': 'Blue Sapphire',
        'WEIGHT': '2.4 Grams',
        'STYLE': 'Stud Earrings',
      }
    };
    
    // Override with arguments if present
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map<String, dynamic>;
      product.addAll(args);
      if (args.containsKey('image')) {
        images[0] = args['image'];
      }
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void onPageChanged(int index) {
    currentImageIndex.value = index;
  }

  void goBack() {
    Get.back();
  }

  void onShare() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Share via',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(
                  icon: FontAwesomeIcons.whatsapp,
                  label: 'WhatsApp',
                  color: const Color(0xFF25D366),
                  onTap: () => _shareText('Check out this amazing jewelry: ${product['name']} - ${product['price']}'),
                ),
                _buildShareOption(
                  icon: FontAwesomeIcons.instagram,
                  label: 'Instagram',
                  color: const Color(0xFFE4405F),
                  onTap: () => _shareText('Check out this amazing jewelry: ${product['name']} - ${product['price']}'),
                ),
                _buildShareOption(
                  icon: FontAwesomeIcons.facebookMessenger,
                  label: 'Messenger',
                  color: const Color(0xFF0084FF),
                  onTap: () => _shareText('Check out this amazing jewelry: ${product['name']} - ${product['price']}'),
                ),
                _buildShareOption(
                  icon: Icons.more_horiz,
                  label: 'More',
                  color: Colors.grey,
                  onTap: () => _shareText('Check out this amazing jewelry: ${product['name']} - ${product['price']}'),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  void _shareText(String text) {
    Get.back(); // Close the bottom sheet
    Share.share(text);
  }

  Widget _buildShareOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  void onChat() {
    Get.toNamed(AppRoutes.supportChat);
  }

  void onRequestQuotation() {
    Get.toNamed(AppRoutes.requestQuotation);
  }
}
