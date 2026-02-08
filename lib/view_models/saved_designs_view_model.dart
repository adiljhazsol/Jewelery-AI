import 'package:get/get.dart';

class SavedDesignsViewModel extends GetxController {
  final savedDesigns = <Map<String, String>>[
    {
      'title': 'Floral Diamond Ring',
      'date': 'Oct 24, 2023',
      'image': 'assets/images/product_diamond_ring.jpg',
    },
    {
      'title': 'Sapphire Pendant',
      'date': 'Oct 22, 2023',
      'image': 'assets/images/product_sapphire_earrings.jpg',
    },
    {
      'title': 'Rose Gold Cuff',
      'date': 'Oct 18, 2023',
      'image': 'assets/images/product_pearl_bracelet.jpg',
    },
    {
      'title': 'Vintage Emeralds',
      'date': 'Oct 15, 2023',
      'image': 'assets/images/product_emerald_ring.jpg',
    },
    {
      'title': 'Art Deco Brooch',
      'date': 'Sep 30, 2023',
      'image': 'assets/images/product_floral_pendant.jpg',
    },
  ].obs;

  void onGetQuote(int index) {
    // Navigate to request quotation or show dialog
    Get.snackbar('Get Quote', 'Requesting quote for ${savedDesigns[index]['title']}');
  }

  void goBack() {
    Get.back();
  }
}
