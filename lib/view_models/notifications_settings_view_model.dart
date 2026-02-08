import 'package:get/get.dart';

class NotificationSettingsViewModel extends GetxController {
  final pushEnabled = true.obs;
  final emailEnabled = true.obs;
  final orderUpdates = true.obs;
  final promotions = false.obs;
  final newArrivals = true.obs;

  void togglePush(bool value) => pushEnabled.value = value;
  void toggleEmail(bool value) => emailEnabled.value = value;
  void toggleOrderUpdates(bool value) => orderUpdates.value = value;
  void togglePromotions(bool value) => promotions.value = value;
  void toggleNewArrivals(bool value) => newArrivals.value = value;

  void goBack() {
    Get.back();
  }
}
