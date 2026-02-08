import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class AIDesignResultViewModel extends GetxController {
  final generatedImage = 'assets/images/product_ruby_vintage.jpg'.obs;
  final title = 'Floral Ruby Ring'.obs;
  final description = 'Art Deco style, 18k Rose Gold, Ruby centerpiece with diamond accents.'.obs;

  void onRegenerate() {
    print('Regenerate clicked');
    // Implement regeneration logic
  }

  void onSave() {
    print('Save clicked');
    Get.snackbar('Success', 'Design saved to your collection');
    Get.toNamed(AppRoutes.savedDesigns);
  }

  void onChat() {
    Get.toNamed(AppRoutes.supportChat);
  }

  void onRequestQuotation() {
    Get.toNamed(AppRoutes.requestQuotation);
  }

  void goBack() {
    Get.back();
  }
}
