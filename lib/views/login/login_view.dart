import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/login_view_model.dart';
import 'package:jewelry_ai/routes/app_routes.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_bg.jpeg',
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
                  SizedBox(height: size.height * 0.05),
                  // Logo
                  GestureDetector(
                    onLongPress: () {
                      Get.toNamed(AppRoutes.adminLogin);
                    },
                    child: Container(
                      width: size.width * 0.2,
                      height: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBA7A60), 
                        borderRadius: BorderRadius.circular(size.width * 0.05),
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          transform: Matrix4.rotationZ(0.785398), 
                          transformAlignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Welcome Back
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                      letterSpacing: -0.5,
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  // Subtitle
                  Text(
                    'Sign in to continue your design journey',
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: size.height * 0.06),

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

                  SizedBox(height: size.height * 0.03),

                  // Password Input
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
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
                    child: Obx(() => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.black87,
                        letterSpacing: 2, 
                      ),
                    )),
                  ),

                  SizedBox(height: size.height * 0.015),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: controller.navigateToForgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: const Color(0xFFBA7A60),
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBA7A60),
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: size.width * 0.038,
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.navigateToSignup,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: const Color(0xFFBA7A60),
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.038,
                          ),
                        ),
                      ),
                    ],
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
