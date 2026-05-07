import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _rateController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController(text: '0');
  final _shippingController = TextEditingController();
  String _category = 'Agriculture';
  String _region = '';
  String _district = '';

  final List<String> _categories = [
    'Agriculture', 'Minerals', 'Textiles', 'Food & Beverage', 'Other'
  ];
  final List<String> _regions = [
    'Greater Accra', 'Ashanti', 'Western', 'Eastern', 'Northern', 'Other'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _rateController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _shippingController.dispose();
    super.dispose();
  }

  void _onContinue() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success icon
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success.withOpacity(0.12),
                ),
                child: Center(
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.success.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.check, color: AppColors.success, size: 28),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Product added Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your product has been submitted and is currently pending review. It will appear on the marketplace once it passes verification.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    Navigator.pop(context); // back to product list
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Back to Dashboard',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text(
                      'Add New Product',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Upload Product Media ──────────────────────────────
                    const Text('Upload Product Media',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                    const SizedBox(height: 4),
                    Text(
                      'Upload media to showcase your products. The first uploaded media will be the main preview.',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    const SizedBox(height: 12),

                    // Main upload area — dashed
                    GestureDetector(
                      onTap: () {},
                      child: CustomPaint(
                        painter: _DashedBorderPainter(
                          color: AppColors.success,
                          strokeWidth: 4.5,
                          dash: 6,
                          gap: 5,
                          radius: 12,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.success.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.image_outlined,
                                    color: AppColors.success, size: 24),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Upload files',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.success,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '  or  drag and drop media',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Upload Product Image grid ──────────────────────────
                    const Text('Upload Product Image',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87)),
                    const SizedBox(height: 8),

                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1,
                      children: [
                        // 5 image upload tiles
                        ...List.generate(5, (i) => _UploadTile(
                          icon: Icons.image_outlined,
                          label: 'Upload image',
                          onTap: () {},
                        )),
                        // 6th tile — upload video
                        _UploadTile(
                          icon: Icons.videocam_outlined,
                          label: 'Upload video',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Form fields ───────────────────────────────────────
                    _FormLabel('Product Name'),
                    const SizedBox(height: 6),
                    _FormInput(controller: _nameController, hint: 'Enter product name'),
                    const SizedBox(height: 14),

                    _FormLabel('Description'),
                    const SizedBox(height: 6),
                    _FormInput(
                      controller: _descController,
                      hint: 'Specify quality grade, specification ...',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FormLabel('Rate (per kg)'),
                              const SizedBox(height: 6),
                              _FormInput(
                                controller: _rateController,
                                hint: '0.00',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FormLabel('Price'),
                              const SizedBox(height: 6),
                              _FormInput(
                                controller: _priceController,
                                hint: '0.00',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FormLabel('Category'),
                              const SizedBox(height: 6),
                              _DropdownField(
                                value: _category,
                                items: _categories,
                                onChanged: (v) => setState(() => _category = v!),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FormLabel('Stock Quantity'),
                              const SizedBox(height: 6),
                              _FormInput(
                                controller: _stockController,
                                hint: '0',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    _FormLabel('Shipping & Delivery (Days)'),
                    const SizedBox(height: 6),
                    _FormInput(
                      controller: _shippingController,
                      hint: 'Time from order to shipment',
                    ),
                    const SizedBox(height: 4),
                    Text('Time from order to shipment',
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
                    const SizedBox(height: 14),

                    _FormLabel('Region'),
                    const SizedBox(height: 6),
                    _DropdownField(
                      value: _region.isEmpty ? null : _region,
                      hint: 'Select region',
                      items: _regions,
                      onChanged: (v) => setState(() => _region = v!),
                    ),
                    const SizedBox(height: 14),

                    _FormLabel('District'),
                    const SizedBox(height: 6),
                    _DropdownField(
                      value: _district.isEmpty ? null : _district,
                      hint: 'Select region',
                      items: _regions,
                      onChanged: (v) => setState(() => _district = v!),
                    ),
                    const SizedBox(height: 28),

                    // ── Continue button ───────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _onContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Upload Tile ───────────────────────────────────────────────────────────────
class _UploadTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _UploadTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: AppColors.success,
          strokeWidth: 4.8,
          dash: 6,
          gap: 5,
          radius: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.success, size: 22),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────────
class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87));
  }
}

class _FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;

  const _FormInput({
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 13, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColors.primaryBlue, width: 1.5),
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String? value;
  final String? hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.items,
    required this.onChanged,
    this.value,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint ?? 'Select',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
        isExpanded: true,
        underline: const SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade500),
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}

// ── Dotted Border Painter ────────────────────────────────────────────────────
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dash;
  final double radius;

  const _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.dash,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2,
            size.width - strokeWidth, size.height - strokeWidth),
        Radius.circular(radius),
      ));

    final dotRadius = strokeWidth * 0.9;
    final spacing = dash + gap;

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final tangent = metric.getTangentForOffset(distance);
        if (tangent != null) {
          canvas.drawCircle(tangent.position, dotRadius, dotPaint);
        }
        distance += spacing;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}