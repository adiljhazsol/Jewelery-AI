import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/add_product_view_model.dart';

class AddProductView extends GetView<AddProductViewModel> {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        title: Obx(() => Text(
          controller.pageTitle.value,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A), size: 20),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Upload Area
                    GestureDetector(
                      onTap: controller.onImageUpload,
                      child: CustomPaint(
                        painter: DashedRectPainter(color: Colors.grey[300]!, strokeWidth: 1.5, gap: 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          alignment: Alignment.center,
                          child: Obx(() {
                            if (controller.imagePath.value.isNotEmpty) {
                               return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle, size: 48, color: Color(0xFFBA7A60)),
                                  SizedBox(height: 12),
                                  Text(
                                    'Image Selected',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.camera_alt_outlined, color: Colors.grey[400], size: 32),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Tap to upload image',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Product Name
                    _buildLabel('Product Name'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controller.nameController,
                      decoration: _inputDecoration('Enter jewelry name'),
                    ),

                    const SizedBox(height: 24),

                    // Category and Material Row
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Category'),
                              const SizedBox(height: 8),
                              Obx(() => _buildDropdown(
                                hint: 'Select',
                                value: controller.selectedCategory.value,
                                items: controller.categories,
                                onChanged: (val) => controller.selectedCategory.value = val!,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Material'),
                              const SizedBox(height: 8),
                              Obx(() => _buildDropdown(
                                hint: 'Select',
                                value: controller.selectedMaterial.value,
                                items: controller.materials,
                                onChanged: (val) => controller.selectedMaterial.value = val!,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Price
                    _buildLabel('Price (USD)'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controller.priceController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration('\$ 0.00'),
                    ),

                    const SizedBox(height: 24),

                    // Description
                    _buildLabel('Description'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controller.descriptionController,
                      maxLines: 4,
                      decoration: _inputDecoration('Enter product description...'),
                    ),

                    const SizedBox(height: 32),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: controller.onSaveProduct,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFBA7A60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Obx(() => Text(
                          controller.isEditMode.value ? 'Update Product' : 'Save Product',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation Bar Placeholder (Static for visual match)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey[200]!)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_outlined, 'Home', false),
                  _buildNavItem(Icons.inventory_2, 'Products', true),
                  _buildNavItem(Icons.request_page_outlined, 'Requests', false),
                  _buildNavItem(Icons.chat_bubble_outline, 'Chat', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1A1A),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
      filled: true,
      fillColor: const Color(0xFFFFF9F6),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[200]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[200]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFBA7A60)),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value.isEmpty ? null : value,
          hint: Text(hint, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 14, color: Color(0xFF1A1A1A))),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFBA7A60) : Colors.grey[400],
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isActive ? const Color(0xFFBA7A60) : Colors.grey[400],
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({this.strokeWidth = 1.0, this.color = Colors.black, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    _drawDashedLine(canvas, size.width, 0, size.width, size.height, dashedPaint); // Right
    _drawDashedLine(canvas, 0, size.height, size.width, size.height, dashedPaint); // Bottom
    _drawDashedLine(canvas, 0, 0, 0, size.height, dashedPaint); // Left
    _drawDashedLine(canvas, 0, 0, size.width, 0, dashedPaint); // Top
  }

  void _drawDashedLine(Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    var max = 10.0; // dash length
    var dashGap = gap;
    
    double dx = x2 - x1;
    double dy = y2 - y1;
    
    // Correct logic
    double distance = (dx.abs() > dy.abs()) ? dx.abs() : dy.abs();
    
    double startX = x1;
    double startY = y1;
    
    // Normalize direction
    double normDx = dx == 0 ? 0 : dx / distance;
    double normDy = dy == 0 ? 0 : dy / distance;
    
    double currentDist = 0;
    while (currentDist < distance) {
      double drawLen = (currentDist + max > distance) ? distance - currentDist : max;
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + normDx * drawLen, startY + normDy * drawLen),
        paint,
      );
      
      startX += normDx * (drawLen + dashGap);
      startY += normDy * (drawLen + dashGap);
      currentDist += drawLen + dashGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// Improved Dashed Border Implementation
class Point<T extends num> {
  final T x;
  final T y;
  const Point(this.x, this.y);
}
