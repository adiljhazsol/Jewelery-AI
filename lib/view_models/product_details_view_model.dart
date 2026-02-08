import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

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
    print('Share clicked');
  }

  void onChat() {
    Get.toNamed(AppRoutes.supportChat);
  }

  void onRequestQuotation() {
    Get.toNamed(AppRoutes.requestQuotation);
  }
}
