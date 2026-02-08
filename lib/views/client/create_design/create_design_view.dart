import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelry_ai/view_models/create_design_view_model.dart';
import 'package:jewelry_ai/widgets/client_bottom_nav.dart';

class CreateDesignView extends GetView<CreateDesignViewModel> {
  const CreateDesignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Create Design',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Texture (Subtle Marble Effect)
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      const Text(
                        'Describe your dream piece',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Our AI will generate a unique design based on your imagination. Be as specific as you like.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Text Input
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: controller.descriptionController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: 'E.g. An 18k gold necklace with a floral pendant featuring a central ruby and small diamond accents...',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Jewelry Type
                      _buildSectionTitle('Jewelry Type'),
                      const SizedBox(height: 12),
                      Obx(() => Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: controller.jewelryTypes.map((type) => 
                          _buildSelectionChip(
                            label: type,
                            isSelected: controller.selectedJewelryType.value == type,
                            onTap: () => controller.selectJewelryType(type),
                          )
                        ).toList(),
                      )),
                      const SizedBox(height: 24),

                      // Material
                      _buildSectionTitle('Material'),
                      const SizedBox(height: 12),
                      Obx(() => Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: controller.materials.map((material) => 
                          _buildSelectionChip(
                            label: material,
                            isSelected: controller.selectedMaterial.value == material,
                            onTap: () => controller.selectMaterial(material),
                          )
                        ).toList(),
                      )),
                      const SizedBox(height: 24),

                      // Gemstone Focus
                      _buildSectionTitle('Gemstone Focus'),
                      const SizedBox(height: 12),
                      Obx(() => Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: controller.gemstones.map((gemstone) => 
                          _buildSelectionChip(
                            label: gemstone,
                            isSelected: controller.selectedGemstone.value == gemstone,
                            onTap: () => controller.selectGemstone(gemstone),
                          )
                        ).toList(),
                      )),
                      const SizedBox(height: 24),

                      // Design Style
                      _buildSectionTitle('Design Style'),
                      const SizedBox(height: 12),
                      Obx(() => Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: controller.styles.map((style) => 
                          _buildSelectionChip(
                            label: style,
                            isSelected: controller.selectedStyle.value == style,
                            onTap: () => controller.selectStyle(style),
                          )
                        ).toList(),
                      )),
                      
                      // Bottom Padding for FAB/Button
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              
              // Bottom Button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: controller.onGenerateDesign,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC48B75), // Terracotta color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Generate Design',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => ClientBottomNav(
        selectedIndex: controller.selectedIndex.value,
        onItemSelected: controller.changeTabIndex,
      )),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildSelectionChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC48B75) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFFC48B75) : Colors.grey[200]!,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFC48B75).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
          ),
        ),
      ),
    );
  }
}
