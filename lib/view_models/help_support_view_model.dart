import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class HelpSupportViewModel extends GetxController {
  
  final faqs = [
    {
      'question': 'How do I track my order?',
      'answer': 'You can track your order in the "Order History" section of your profile. Click on any active order to see real-time status updates.'
    },
    {
      'question': 'Can I customize a design?',
      'answer': 'Yes! Use our "AI Design" tool to generate unique jewelry concepts, or use the "Request Quotation" feature to send us your custom requirements.'
    },
    {
      'question': 'What is your return policy?',
      'answer': 'We accept returns within 30 days of delivery for unworn items in original packaging. Custom-made items are non-refundable unless defective.'
    },
    {
      'question': 'Do you ship internationally?',
      'answer': 'Yes, we ship to over 50 countries worldwide. Shipping costs and times vary by location.'
    },
  ];

  void onChatSupportTap() {
    Get.toNamed(AppRoutes.supportChat);
  }

  void onEmailSupportTap() {
    // In a real app, launch email client
    Get.snackbar('Email Support', 'Opening email client...');
  }

  void goBack() {
    Get.back();
  }
}
