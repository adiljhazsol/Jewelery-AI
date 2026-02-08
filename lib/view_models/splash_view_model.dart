import 'dart:async';
import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class SplashViewModel extends GetxController {
  Timer? _navigationTimer;
  Timer? _adminTimer;

  @override
  void onInit() {
    super.onInit();
    _startNavigationTimer();
  }

  void _startNavigationTimer() {
    _navigationTimer = Timer(const Duration(seconds: 6), () {
      Get.offNamed(AppRoutes.login);
    });
  }

  void startAdminLoginTimer() {
    _adminTimer?.cancel();
    _adminTimer = Timer(const Duration(seconds: 4), () {
      _navigationTimer?.cancel();
      Get.offNamed(AppRoutes.adminLogin);
    });
  }

  void cancelAdminLoginTimer() {
    _adminTimer?.cancel();
  }

  @override
  void onClose() {
    _navigationTimer?.cancel();
    _adminTimer?.cancel();
    super.onClose();
  }
}
