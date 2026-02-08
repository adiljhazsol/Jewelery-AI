import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/profile_view_model.dart';
import 'package:jewelry_ai/widgets/client_bottom_nav.dart';

class ProfileView extends GetView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Light background
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Gradient (Subtle)
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFDFBF9), // Very light warm tone
                  Color(0xFFFAFAFA),
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  // Profile Avatar Section
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Obx(() {
                              if (controller.selectedImage.value != null) {
                                return Image.file(
                                  controller.selectedImage.value!,
                                  fit: BoxFit.cover,
                                );
                              }
                              return Image.asset(
                                controller.userAvatarUrl.value,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.person, size: 60, color: Colors.white),
                                ),
                              );
                            }),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: controller.onEditProfile,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFBA7A60),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.edit, size: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // User Info
                  Obx(() => Text(
                    controller.userName.value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  )),
                  const SizedBox(height: 4),
                  Obx(() => Text(
                    controller.userEmail.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  )),
                  
                  const SizedBox(height: 32),

                  // Menu Section 1
                  _buildMenuSection([
                    _buildMenuItem(Icons.person_outline, 'Personal Details'),
                    _buildMenuItem(Icons.favorite_border, 'Saved Designs'),
                    _buildMenuItem(Icons.history, 'Order History'),
                  ]),

                  const SizedBox(height: 24),

                  // Menu Section 2
                  _buildMenuSection([
                    _buildMenuItem(Icons.notifications_outlined, 'Notifications'),
                    _buildMenuItem(Icons.settings_outlined, 'App Settings'),
                    _buildMenuItem(Icons.help_outline, 'Help & Support'),
                  ]),

                  const SizedBox(height: 32),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.onLogout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFF0F0), // Light red background
                        foregroundColor: const Color(0xFFD32F2F), // Red text
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  // Bottom Padding
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => ClientBottomNav(
        selectedIndex: controller.selectedIndex,
        onItemSelected: controller.changeTabIndex,
      )),
    );
  }

  Widget _buildMenuSection(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => controller.onMenuOptionTap(title),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: Colors.grey[700]),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 20, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
