import 'package:get/get.dart';

class MyQuotationsViewModel extends GetxController {
  final selectedFilterIndex = 0.obs;
  final filters = ['All Requests', 'Pending', 'Approved', 'Rejected'];

  // Mock Data
  final allQuotations = [
    {
      'id': '8291',
      'title': 'Ruby Signet Ring',
      'date': 'Oct 24',
      'status': 'RECEIVED', // RECEIVED (Blue)
      'image': 'assets/images/product_ruby_vintage.jpg',
      'footerLabel': 'Quote:',
      'footerValue': '\$1,250.00',
      'actionText': 'Review',
    },
    {
      'id': '8305',
      'title': 'Diamond Solitaire Pendant',
      'date': 'Just now',
      'status': 'SUBMITTED', // SUBMITTED (Orange)
      'image': 'assets/images/product_floral_pendant.jpg',
      'footerLabel': 'Est:',
      'footerValue': 'Pending',
      'actionText': 'View Details',
    },
    {
      'id': '7102',
      'title': 'Emerald Drop Earrings',
      'date': 'Oct 15',
      'status': 'APPROVED', // APPROVED (Green)
      'image': 'assets/images/product_sapphire_earrings.jpg',
      'footerLabel': 'Total:',
      'footerValue': '\$2,100.00',
      'actionText': 'Track Order',
    },
    {
      'id': '6881',
      'title': 'Custom Cuff Bracelet',
      'date': 'Oct 10',
      'status': 'REJECTED', // REJECTED (Red)
      'image': 'assets/images/product_pearl_bracelet.jpg',
      'footerLabel': 'Reason:',
      'footerValue': 'Design infeasible',
      'actionText': 'View Notes',
    },
  ].obs;

  List<Map<String, String>> get filteredQuotations {
    if (selectedFilterIndex.value == 0) {
      return allQuotations;
    }
    String filter = filters[selectedFilterIndex.value].toUpperCase();
    // Map filter names to status codes if needed, or just match logic
    if (filter == 'PENDING') {
      return allQuotations.where((q) => q['status'] == 'SUBMITTED' || q['status'] == 'RECEIVED').toList();
    }
    return allQuotations.where((q) => q['status'] == filter).toList();
  }

  void changeFilter(int index) {
    selectedFilterIndex.value = index;
  }

  void onActionTap(String id) {
    print('Action tapped for request #$id');
  }

  void goBack() {
    Get.back();
  }
}
