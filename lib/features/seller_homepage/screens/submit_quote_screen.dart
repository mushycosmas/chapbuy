import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SubmitQuoteScreen extends StatefulWidget {
  final String orderId;
  final String productName;
  final String buyerName;
  final String quantity;
  final String targetPrice;
  final String incoterm;

  const SubmitQuoteScreen({
    super.key,
    this.orderId = 'ORD-2024-001',
    this.productName = 'White Maize',
    this.buyerName = 'Continental Foods Ltd',
    this.quantity = '100 MT',
    this.targetPrice = '\$50 - \$70',
    this.incoterm = 'CIF',
  });

  @override
  State<SubmitQuoteScreen> createState() => _SubmitQuoteScreenState();
}

class _SubmitQuoteScreenState extends State<SubmitQuoteScreen> {
  final _unitPriceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _deliveryDaysController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _unitPriceController.dispose();
    _quantityController.dispose();
    _deliveryDaysController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _onSubmitTapped() {
    // Show counter offer bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _CounterOfferSheet(
        orderId: widget.orderId,
        productName: widget.productName,
        buyerName: widget.buyerName,
        quantity: widget.quantity,
        targetPrice: widget.targetPrice,
        incoterm: widget.incoterm,
        onSubmitted: () {
          Navigator.pop(context); // close bottom sheet
          _showSuccessDialog();
        },
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _SuccessDialog(
        onBack: () {
          Navigator.pop(context); // close dialog
          Navigator.pop(context); // back to rfq detail
          Navigator.pop(context); // back to home
        },
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
                  Expanded(
                    child: Text(
                      widget.orderId,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Summary Card ──────────────────────────────────────
                    _SummaryCard(
                      productName: widget.productName,
                      buyerName: widget.buyerName,
                      quantity: widget.quantity,
                      targetPrice: widget.targetPrice,
                      incoterm: widget.incoterm,
                    ),
                    const SizedBox(height: 20),

                    // ── Pricing Quote Form ────────────────────────────────
                    const Text(
                      'Pricing Quote',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _FormLabel(label: 'Unit Price (USD per MT)'),
                    const SizedBox(height: 6),
                    _FormField(
                      controller: _unitPriceController,
                      hint: 'Enter your price',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 14),
                    _FormLabel(label: 'Quantity You Can Supply'),
                    const SizedBox(height: 6),
                    _FormField(
                      controller: _quantityController,
                      hint: 'Enter quantity',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 14),
                    _FormLabel(label: 'Delivery Days'),
                    const SizedBox(height: 6),
                    _FormField(
                      controller: _deliveryDaysController,
                      hint: 'Enter delivery days',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 14),
                    _FormLabel(label: 'Message to buyer'),
                    const SizedBox(height: 6),
                    _FormField(
                      controller: _messageController,
                      hint: 'Additional message to the buyer',
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),

            // ── Submit Button ─────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              color: AppColors.background,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _onSubmitTapped,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Counter Offer Bottom Sheet ────────────────────────────────────────────────
class _CounterOfferSheet extends StatefulWidget {
  final String orderId;
  final String productName;
  final String buyerName;
  final String quantity;
  final String targetPrice;
  final String incoterm;
  final VoidCallback onSubmitted;

  const _CounterOfferSheet({
    required this.orderId,
    required this.productName,
    required this.buyerName,
    required this.quantity,
    required this.targetPrice,
    required this.incoterm,
    required this.onSubmitted,
  });

  @override
  State<_CounterOfferSheet> createState() => _CounterOfferSheetState();
}

class _CounterOfferSheetState extends State<_CounterOfferSheet> {
  final _unitPriceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _deliveryDaysController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _unitPriceController.dispose();
    _quantityController.dispose();
    _deliveryDaysController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // drag handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // ── Summary card inside sheet ─────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _SummaryCard(
              productName: widget.productName,
              buyerName: widget.buyerName,
              quantity: widget.quantity,
              targetPrice: widget.targetPrice,
              incoterm: widget.incoterm,
            ),
          ),
          const SizedBox(height: 16),

          // ── Title ─────────────────────────────────────────────────────
          const Text(
            'Your Counter Offer',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // ── Form fields ───────────────────────────────────────────────
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FormLabel(label: 'Unit Price (USD per MT)'),
                  const SizedBox(height: 6),
                  _FormField(
                    controller: _unitPriceController,
                    hint: 'Enter your price',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 14),
                  _FormLabel(label: 'Quantity You Can Supply'),
                  const SizedBox(height: 6),
                  _FormField(
                    controller: _quantityController,
                    hint: 'Enter quantity',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 14),
                  _FormLabel(label: 'Delivery Days'),
                  const SizedBox(height: 6),
                  _FormField(
                    controller: _deliveryDaysController,
                    hint: 'Enter delivery days',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 14),
                  _FormLabel(label: 'Message to buyer'),
                  const SizedBox(height: 6),
                  _FormField(
                    controller: _messageController,
                    hint: 'Additional message to the buyer',
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),

                  // ── Submit button ──────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: widget.onSubmitted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Success Dialog ────────────────────────────────────────────────────────────
class _SuccessDialog extends StatelessWidget {
  final VoidCallback onBack;
  const _SuccessDialog({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Success icon ──────────────────────────────────────────────
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.success.withOpacity(0.12),
              ),
              child: Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.success.withOpacity(0.2),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.success,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ── Title ─────────────────────────────────────────────────────
            const Text(
              'Bid Submitted Successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // ── Subtitle ──────────────────────────────────────────────────
            Text(
              "Your bid has been sent and is now under review. We'll notify you as soon as there's an update.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // ── Back button ───────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: onBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Back',
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
    );
  }
}

// ── Shared Widgets ────────────────────────────────────────────────────────────
class _SummaryCard extends StatelessWidget {
  final String productName;
  final String buyerName;
  final String quantity;
  final String targetPrice;
  final String incoterm;

  const _SummaryCard({
    required this.productName,
    required this.buyerName,
    required this.quantity,
    required this.targetPrice,
    required this.incoterm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _SummaryField(label: 'Buyer', value: buyerName),
              ),
              Expanded(
                child: _SummaryField(
                  label: 'Quantity',
                  value: quantity,
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _SummaryField(label: 'Target Price', value: targetPrice),
              ),
              Expanded(
                child: _SummaryField(
                  label: 'Incoterm',
                  value: incoterm,
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryField extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;

  const _SummaryField({
    required this.label,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
        const SizedBox(height: 3),
        Text(value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            )),
      ],
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String label;
  const _FormLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;

  const _FormField({
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
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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