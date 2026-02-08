import 'package:get/get.dart';

class NotificationsViewModel extends GetxController {
  final notifications = <Map<String, dynamic>>[
    {
      'title': 'Design Ready',
      'message': 'Your "Ruby Pendant" design is ready for review.',
      'time': '2 hours ago',
      'isRead': false,
    },
    {
      'title': 'New Collection',
      'message': 'Check out our new Summer Collection!',
      'time': '1 day ago',
      'isRead': true,
    },
    {
      'title': 'Order Shipped',
      'message': 'Your order #ORD-0554 has been shipped.',
      'time': '2 days ago',
      'isRead': true,
    },
    {
      'title': 'Welcome Gift',
      'message': 'Here is a 10% discount code for your first purchase: WELCOME10',
      'time': '1 week ago',
      'isRead': true,
    },
  ].obs;

  void markAsRead(int index) {
    var notification = notifications[index];
    notification['isRead'] = true;
    notifications[index] = notification;
  }
}
