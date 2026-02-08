import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class LogoutViewModel extends GetxController {
  void onSignInAgain() {
    Get.offAllNamed(AppRoutes.login);
  }

  void onCreateAccount() {
    Get.offAllNamed(AppRoutes.signup);
  }
}
