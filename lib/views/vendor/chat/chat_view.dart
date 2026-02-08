import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/chat_view_model.dart';
import 'dart:io';

class ChatView extends GetView<ChatViewModel> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A), size: 20),
            onPressed: () => Get.back(),
          ),
        ),
        title: Obx(() => Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(controller.chatAvatar.value),
                  backgroundColor: Colors.grey,
                ),
                if (controller.isOnline.value)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.chatName.value,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (controller.isOnline.value)
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E7D32),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Online',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF1A1A1A)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat Area
          Expanded(
            child: Obx(() => ListView.builder(
              controller: controller.scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: controller.messages.length + 1, // +1 for date header
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildDateHeader();
                }
                final message = controller.messages[index - 1];
                return _buildMessageBubble(message);
              },
            )),
          ),

          // Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[100]!)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  _buildActionButton(Icons.add, onTap: controller.showAttachmentOptions),
                  const SizedBox(width: 8),
                  _buildActionButton(Icons.camera_alt_outlined, onTap: controller.pickImageFromCamera),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: controller.messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: controller.sendMessage,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFFBA7A60),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Today',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: message.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (message.type == MessageType.image && message.imageUrl != null)
            Container(
              width: 240,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildImage(message.imageUrl!),
              ),
            )
          else if (message.type == MessageType.file)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: message.isSender ? const Color(0xFFBA7A60) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: message.isSender ? null : Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.insert_drive_file, color: message.isSender ? Colors.white : Colors.grey[600]),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      message.fileName ?? 'File',
                      style: TextStyle(
                        color: message.isSender ? Colors.white : const Color(0xFF1A1A1A),
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxWidth: 260),
              decoration: BoxDecoration(
                color: message.isSender ? const Color(0xFFBA7A60) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(message.isSender ? 20 : 4),
                  bottomRight: Radius.circular(message.isSender ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                message.content,
                style: TextStyle(
                  color: message.isSender ? Colors.white : const Color(0xFF1A1A1A),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          const SizedBox(height: 6),
          Text(
            message.timestamp,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    ImageProvider imageProvider;
    if (path.startsWith('http') || path.startsWith('https')) {
      imageProvider = NetworkImage(path);
    } else if (path.startsWith('assets/')) {
      imageProvider = AssetImage(path);
    } else {
      imageProvider = FileImage(File(path));
    }
    return Image(
      image: imageProvider,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        );
      },
    );
  }

  Widget _buildActionButton(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.grey[500], size: 20),
      ),
    );
  }
}
