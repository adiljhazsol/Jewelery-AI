import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/splash_view_model.dart';

class SplashView extends GetView<SplashViewModel> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // White Radial Gradient Overlay (Vignette)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    Colors.white.withOpacity(0.1), // Low opacity in center (showing image)
                    Colors.white, // Opaque white on sides
                  ],
                  stops: const [0.4, 1.0], // 75% image visibility feel
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4), 
                
                // Logo
                GestureDetector(
                  onTapDown: (_) => controller.startAdminLoginTimer(),
                  onTapUp: (_) => controller.cancelAdminLoginTimer(),
                  onTapCancel: () => controller.cancelAdminLoginTimer(),
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
                        transform: Matrix4.rotationZ(0.785398), // Rotate 45 degrees
                        transformAlignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: size.height * 0.03),

                // Title
                Text(
                  'Jewelry AI',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w900, 
                    color: const Color(0xFF1A1A1A),
                    letterSpacing: -0.5,
                    fontFamily: 'Roboto', 
                  ),
                ),
                
                SizedBox(height: size.height * 0.01),

                // Subtitle
                Text(
                  'DESIGN YOUR DREAM',
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w900,
                    // Non-italic
                    color: Colors.black, // Black
                    letterSpacing: 2.0,
                  ),
                ),
                
                const Spacer(flex: 4),

                // Loading Dots
                const LoadingDots(),

                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Opacity(
              opacity: _getOpacity(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.black, // Black
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  double _getOpacity(int index) {
    final double value = _controller.value;
    final double start = index * 0.2;
    final double end = start + 0.4;
    
    if (value >= start && value <= end) {
      return 1.0;
    } else {
      return 0.3;
    }
  }
}
