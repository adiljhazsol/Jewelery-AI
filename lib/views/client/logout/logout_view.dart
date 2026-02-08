import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/logout_view_model.dart';

class LogoutView extends GetView<LogoutViewModel> {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Icon Placeholder
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFEEEEEE)),
                ),
                child: const Center(
                  // Using a placeholder icon since the image is just a white circle in the screenshot
                  // But usually implies a user or lock. Let's use a subtle lock or person icon if needed, 
                  // or just keep it blank/white as per screenshot.
                  // The screenshot shows a very faint circle inside or just white. 
                  // Let's add a very subtle icon to make it look intentional, or just empty.
                  // "You've been logged out" usually pairs with a lock or empty user state.
                  // I'll leave it empty to match the screenshot exactly which seems to just be a graphic placeholder.
                ),
              ),
              const SizedBox(height: 32),
              
              // Title
              const Text(
                "You've been logged out",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),
              
              // Subtitle
              Text(
                "We hope to see you again soon.\nYour session has ended securely.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              
              const Spacer(),
              
              // Sign In Again Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: controller.onSignInAgain,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBA7A60), // Brown/Gold color from previous screens
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Sign In Again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Create New Account Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: controller.onCreateAccount,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Create New Account",
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
