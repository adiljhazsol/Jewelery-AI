import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/forgot_view_model.dart';

class ForgotView extends GetView<ForgotViewModel> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.4), 
                    Colors.white.withOpacity(0.9), 
                    Colors.white, 
                  ],
                  stops: const [0.0, 0.4, 0.55], 
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Forgot Password Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1A1A),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.02),

                  // Subtitle
                  Text(
                    "Don't worry! It happens. Please enter the email address associated with your account.",
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  // Email Input
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        hintText: 'Enter your email',
                      ),
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Send Reset Code Button
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: controller.sendResetCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBA7A60),
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Send Reset Code',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.3),

                  // Back to Login Link
                  GestureDetector(
                    onTap: controller.navigateToLogin,
                    child: Text(
                      'Back to Login',
                      style: TextStyle(
                        color: const Color(0xFFBA7A60),
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * 0.038,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
