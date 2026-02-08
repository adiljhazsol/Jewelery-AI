import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class InboxViewModel extends GetxController {
  final chats = [
    {
      'id': '1',
      'name': 'Sarah Jenkins',
      'message': 'VS1 or better, please. Also, can we make the band slightly thinner?',
      'time': '10:35 AM',
      'unreadCount': 2,
      'avatar': 'assets/images/user_avatar.jpg',
      'isOnline': true,
    },
    {
      'id': '2',
      'name': 'Michael Chen',
      'message': 'Is the platinum option available for this design?',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatar': 'assets/images/user_avatar.jpg',
      'isOnline': false,
    },
    {
      'id': '3',
      'name': 'Emma Wilson',
      'message': 'Thank you for the quick quotation!',
      'time': '2 days ago',
      'unreadCount': 0,
      'avatar': 'assets/images/user_avatar.jpg',
      'isOnline': true,
    },
    {
      'id': '4',
      'name': 'David Ross',
      'message': 'I would like to schedule a call to discuss the gems.',
      'time': '3 days ago',
      'unreadCount': 1,
      'avatar': 'assets/images/user_avatar.jpg',
      'isOnline': false,
    },
  ].obs;

  void onChatTap(Map<String, dynamic> chat) {
    Get.toNamed(AppRoutes.chatDetail, arguments: chat);
  }
}
