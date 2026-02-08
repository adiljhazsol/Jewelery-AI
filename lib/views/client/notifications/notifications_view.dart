import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/notifications_view_model.dart';

class NotificationsView extends GetView<NotificationsViewModel> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text(
          'Notifications', 
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => ListView.separated(
        itemCount: controller.notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notification = controller.notifications[index];
          final isRead = notification['isRead'] as bool;
          
          return Material(
            color: isRead ? Colors.white : const Color(0xFFFFF8F6),
            child: InkWell(
              onTap: () => controller.markAsRead(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBA7A60).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_outlined, 
                        color: Color(0xFFBA7A60),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification['title'],
                                style: TextStyle(
                                  fontWeight: isRead ? FontWeight.w600 : FontWeight.bold,
                                  color: const Color(0xFF1A1A1A),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                notification['time'],
                                style: TextStyle(
                                  fontSize: 12, 
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            notification['message'],
                            style: TextStyle(
                              color: isRead ? Colors.grey[700] : const Color(0xFF1A1A1A),
                              height: 1.4,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isRead)
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 5),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBA7A60),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
