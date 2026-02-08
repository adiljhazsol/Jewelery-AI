import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class ProfileViewModel extends GetxController {
  final _selectedIndex = 3.obs; // Profile tab index
  int get selectedIndex => _selectedIndex.value;

  final userName = 'Jessica Anderson'.obs;
  final userEmail = 'jessica.anderson@example.com'.obs;
  final userAvatarUrl = 'assets/images/user_avatar.jpg'.obs;
  
  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  void changeTabIndex(int index) {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed(AppRoutes.home);
        break;
      case 1:
        Get.offNamed(AppRoutes.collections);
        break;
      case 2:
        // AI Design
        Get.offNamed(AppRoutes.createDesign);
        break;
      case 3:
        // Already on Profile
        break;
    }
  }

  Future<void> onEditProfile() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage.value = File(image.path);
        Get.snackbar('Success', 'Profile image updated successfully');
      }
    } catch (e) {
      print('Error picking image: $e');
      Get.snackbar('Error', 'Could not pick image: $e');
    }
  }

  void onMenuOptionTap(String title) {
    print('$title clicked');
    if (title == 'Order History') {
      Get.toNamed(AppRoutes.orderHistory);
    } else if (title == 'Saved Designs') {
      Get.toNamed(AppRoutes.savedDesigns);
    } else if (title == 'Help & Support') {
      Get.toNamed(AppRoutes.helpSupport);
    } else if (title == 'Personal Details') {
      Get.toNamed(AppRoutes.personalInformation);
    } else if (title == 'App Settings') {
      Get.toNamed(AppRoutes.appSettings);
    } else if (title == 'Notifications') {
      Get.toNamed(AppRoutes.notificationSettings);
    }
  }

  void onLogout() {
    print('Logout clicked');
    Get.offAllNamed(AppRoutes.logout);
  }
}
