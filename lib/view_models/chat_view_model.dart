import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

enum MessageType { text, image, file }

class Message {
  final String id;
  final String content;
  final bool isSender;
  final String timestamp;
  final MessageType type;
  final String? imageUrl;
  final String? fileName;

  Message({
    required this.id,
    required this.content,
    required this.isSender,
    required this.timestamp,
    this.type = MessageType.text,
    this.imageUrl,
    this.fileName,
  });
}

class ChatViewModel extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final RxList<Message> messages = <Message>[].obs;
  final ImagePicker _picker = ImagePicker();

  final RxString chatName = ''.obs;
  final RxString chatAvatar = ''.obs;
  final RxBool isOnline = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      chatName.value = args['name'] ?? 'Chat';
      chatAvatar.value = args['avatar'] ?? '';
      isOnline.value = args['isOnline'] ?? false;
    }
    loadMessages();
  }

  void loadMessages() {
    messages.addAll([
      Message(
        id: '1',
        content: 'Hi, I just submitted a request for a custom gold ring design.',
        isSender: false,
        timestamp: '10:23 AM',
      ),
      Message(
        id: '2',
        content: '',
        isSender: false,
        timestamp: '10:24 AM',
        type: MessageType.image,
        imageUrl: 'assets/images/product_ruby_vintage.jpg', // Ring image
      ),
      Message(
        id: '3',
        content: "Hello Sarah! I've received your design request. It looks stunning.",
        isSender: true,
        timestamp: '10:30 AM',
      ),
      Message(
        id: '4',
        content: 'I can prepare a formal quotation for this within 2 hours. Did you have a specific diamond clarity in mind?',
        isSender: true,
        timestamp: '10:31 AM',
      ),
      Message(
        id: '5',
        content: 'VS1 or better, please. Also, can we make the band slightly thinner?',
        isSender: false,
        timestamp: '10:35 AM',
      ),
      Message(
        id: '6',
        content: "Absolutely. I'll adjust the specifications and send over the quote shortly!",
        isSender: true,
        timestamp: '10:36 AM',
      ),
    ]);
    
    // Scroll to bottom after loading
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void showAttachmentOptions() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(
                  icon: Icons.folder,
                  label: 'Files',
                  color: Colors.blue,
                  onTap: () {
                    Get.back();
                    pickFile();
                  },
                ),
                _buildAttachmentOption(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  color: Colors.red,
                  onTap: () {
                    Get.back();
                    pickImageFromCamera();
                  },
                ),
                _buildAttachmentOption(
                  icon: Icons.image,
                  label: 'Gallery',
                  color: Colors.purple,
                  onTap: () {
                    Get.back();
                    pickImageFromGallery();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        _sendImageMessage(photo.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not access camera: $e');
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _sendImageMessage(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not access gallery: $e');
    }
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String? path = result.files.single.path;
        if (path != null) {
          if (_isImage(path)) {
            _sendImageMessage(path);
          } else {
            _sendFileMessage(result.files.single.name, path);
          }
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not pick file: $e');
    }
  }

  bool _isImage(String path) {
    final extension = path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'webp', 'heic'].contains(extension);
  }

  void _sendImageMessage(String path) {
    messages.add(Message(
      id: DateTime.now().toString(),
      content: '',
      isSender: true,
      timestamp: _getCurrentTime(),
      type: MessageType.image,
      imageUrl: path,
    ));
    _scrollToBottom();
  }

  void _sendFileMessage(String fileName, String path) {
    messages.add(Message(
      id: DateTime.now().toString(),
      content: fileName,
      isSender: true,
      timestamp: _getCurrentTime(),
      type: MessageType.file,
      fileName: fileName,
      imageUrl: path, // Storing path in imageUrl for simplicity or create filePath
    ));
    _scrollToBottom();
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    final newMessage = Message(
      id: DateTime.now().toString(),
      content: messageController.text,
      isSender: true,
      timestamp: _getCurrentTime(),
    );

    messages.add(newMessage);
    messageController.clear();
    _scrollToBottom();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100, // Add a bit more to ensure full visibility
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
