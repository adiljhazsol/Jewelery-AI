import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/inbox_view_model.dart';

class InboxView extends GetView<InboxViewModel> {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Inbox',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBA7A60).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit_square, color: Color(0xFFBA7A60), size: 20),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search messages...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Chat List
            Expanded(
              child: Obx(() => ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: controller.chats.length,
                separatorBuilder: (context, index) => const Divider(height: 24),
                itemBuilder: (context, index) {
                  final chat = controller.chats[index];
                  return GestureDetector(
                    onTap: () => controller.onChatTap(chat),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage(chat['avatar'] as String),
                                backgroundColor: Colors.grey[200],
                              ),
                              if (chat['isOnline'] as bool)
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF2E7D32),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                  ),
                                ),
                            ],
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
                                      chat['name'] as String,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    Text(
                                      chat['time'] as String,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: (chat['unreadCount'] as int) > 0 
                                            ? const Color(0xFFBA7A60) 
                                            : Colors.grey[500],
                                        fontWeight: (chat['unreadCount'] as int) > 0 
                                            ? FontWeight.w600 
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        chat['message'] as String,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: (chat['unreadCount'] as int) > 0 
                                              ? const Color(0xFF1A1A1A) 
                                              : Colors.grey[600],
                                          fontWeight: (chat['unreadCount'] as int) > 0 
                                              ? FontWeight.w600 
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    if ((chat['unreadCount'] as int) > 0)
                                      Container(
                                        margin: const EdgeInsets.only(left: 8),
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFBA7A60),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          (chat['unreadCount'] as int).toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
