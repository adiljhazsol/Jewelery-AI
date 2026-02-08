import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class SupportChatViewModel extends GetxController {
  final messageController = TextEditingController();
  final scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();

  final messages = <Map<String, dynamic>>[
    {
      'isMe': false,
      'text': "Hello! I see you're interested in the Royal Sapphire collection. How can I assist you today?",
      'time': '10:30 AM',
      'type': 'text',
    },
    {
      'isMe': true,
      'text': "Hi! Yes, I actually generated a variation of that ring using your AI tool. Can you take a look?",
      'time': '10:32 AM',
      'type': 'text',
    },
    {
      'isMe': true,
      'image': 'assets/images/product_diamond_ring.jpg', // Placeholder for sketch
      'time': '10:32 AM',
      'type': 'image',
    },
    {
      'isMe': false,
      'text': "That looks exquisite! The prong setting really highlights the stone. We can definitely create this for you.",
      'time': '10:33 AM',
      'type': 'text',
    },
    {
      'isMe': false,
      'text': "Would you like a formal quotation for this custom piece in 18k White Gold?",
      'time': '10:34 AM',
      'type': 'text',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // Scroll to bottom after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        _addMessage(type: 'image', content: image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        String filePath = result.files.single.path!;
        // Check if it's an image to display it as image, otherwise handle as file (future improvement)
        // For now, if it's an image extension, treat as image type
        if (_isImageFile(filePath)) {
          _addMessage(type: 'image', content: filePath);
        } else {
          _addMessage(type: 'text', content: 'Sent a file: ${result.files.single.name}');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick file: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  bool _isImageFile(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(ext);
  }

  void _addMessage({required String type, required String content}) {
    messages.add({
      'isMe': true,
      type == 'text' ? 'text' : 'image': content,
      'time': _formatCurrentTime(),
      'type': type,
    });
    
    // Simulate delayed response
    Future.delayed(const Duration(seconds: 1), () {
      scrollToBottom();
    });
    
    // Scroll to bottom immediately
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToBottom();
    });
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    _addMessage(type: 'text', content: messageController.text);
    messageController.clear();
  }

  String _formatCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
