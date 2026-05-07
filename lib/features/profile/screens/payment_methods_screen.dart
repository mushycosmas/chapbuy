import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final List<_PaymentCard> _cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        Text('Payment Method', textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
                        SizedBox(height: 2),
                        Text('Manage your payment quickly and securely.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                  if (_cards.isNotEmpty)
                    GestureDetector(
                      onTap: () => _showAddCardDialog(context),
                      child: Row(
                        children: [
                          Icon(Icons.add_circle_outline, size: 16, color: AppColors.success),
                          const SizedBox(width: 4),
                          Text('Add New',
                              style: TextStyle(fontSize: 13, color: AppColors.success, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    )
                  else
                    const SizedBox(width: 60),
                ],
              ),
            ),

            Expanded(
              child: _cards.isEmpty
                  ? _buildEmptyState(context)
                  : _buildCardList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
            child: Icon(Icons.diamond_outlined, size: 36, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 16),
          const Text('No Payment Method Added',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87)),
          const SizedBox(height: 8),
          Text('You have not added any payment method yet.\nAdd one to get started.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5)),
          const SizedBox(height: 28),
          GestureDetector(
            onTap: () => _showAddCardDialog(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: BoxDecoration(color: AppColors.success, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_circle_outline, size: 18, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Add New Payment Method',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _cards.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _PaymentCardTile(card: _cards[i]),
    );
  }

  void _showAddCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _AddCardDialog(
        onSaved: (card) {
          setState(() {
            // First time: seed all 3 demo cards like the design shows
            if (_cards.isEmpty) {
              _cards.addAll([
                const _PaymentCard(name: 'Account Holder', type: 'Master Card',
                    maskedNumber: '•••• •••• •••• 2879', isPrimary: true),
                const _PaymentCard(name: 'Account Holder', type: 'Visa Card',
                    maskedNumber: '•••• •••• •••• 2879', isPrimary: false),
                const _PaymentCard(name: 'Account Holder', type: 'Pay Pal',
                    maskedNumber: '•••• •••• •••• 2879', isPrimary: false),
              ]);
            } else {
              _cards.add(card);
            }
          });
          Navigator.pop(context);
          _showSuccessDialog(context);
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 32),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80, height: 80,
                decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: 56, height: 56,
                    decoration: BoxDecoration(color: AppColors.success.withOpacity(0.2), shape: BoxShape.circle),
                    child: const Icon(Icons.check, color: AppColors.success, size: 30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Payment Method added Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 10),
              Text('Your product method has been added successfully. You can now start using it for transactions or manage it anytime in your settings.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity, height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Back to Dashboard',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Add Card Dialog ───────────────────────────────────────────────────────────
class _AddCardDialog extends StatefulWidget {
  final ValueChanged<_PaymentCard> onSaved;
  const _AddCardDialog({required this.onSaved});

  @override
  State<_AddCardDialog> createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<_AddCardDialog> {
  final _nameController   = TextEditingController();
  final _numberController = TextEditingController();
  final _expController    = TextEditingController();
  final _cvvController    = TextEditingController();
  String _cardType = 'Master Card';
  bool _setPrimary = false;
  bool _obscureCvv = true;
  final List<String> _cardTypes = ['Master Card', 'Visa Card', 'Pay Pal', 'Verve'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text('Set Up Your Payment Account',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87)),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 20, color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text('Securely link your payment account',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
            const SizedBox(height: 20),

            _DialogField(label: 'Enter Full Name On Card', hint: 'Account Holder Name',
                controller: _nameController),
            const SizedBox(height: 14),

            _DialogField(label: 'Enter Card Number', hint: 'Bank Name',
                controller: _numberController, keyboardType: TextInputType.number),
            const SizedBox(height: 14),

            const Text('Card Type',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: DropdownButton<String>(
                value: _cardType, isExpanded: true, underline: const SizedBox(),
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade500),
                style: const TextStyle(fontSize: 13, color: Colors.black87),
                items: _cardTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (v) => setState(() => _cardType = v!),
              ),
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _DialogField(label: 'Expiration Date', hint: '06 / 12',
                      controller: _expController, keyboardType: TextInputType.datetime),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('CVV',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _cvvController,
                        obscureText: _obscureCvv,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          hintText: '•••', counterText: '',
                          filled: true, fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() => _obscureCvv = !_obscureCvv),
                            child: Icon(_obscureCvv ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                size: 18, color: Colors.grey.shade400),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade200)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => setState(() => _setPrimary = !_setPrimary),
              child: Row(
                children: [
                  SizedBox(
                    width: 20, height: 20,
                    child: Checkbox(
                      value: _setPrimary,
                      onChanged: (v) => setState(() => _setPrimary = v!),
                      activeColor: AppColors.success,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Set as primary payment account',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity, height: 50,
              child: ElevatedButton(
                onPressed: () => widget.onSaved(_PaymentCard(
                  name: _nameController.text.isEmpty ? 'Account Holder' : _nameController.text,
                  type: _cardType,
                  maskedNumber: '•••• •••• •••• 2879',
                  isPrimary: _setPrimary,
                )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success, elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Save Card',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Payment Card Tile ─────────────────────────────────────────────────────────
class _PaymentCardTile extends StatelessWidget {
  final _PaymentCard card;
  const _PaymentCardTile({required this.card});

  Widget get _icon {
    switch (card.type) {
      case 'Visa Card':
        return Container(width: 36, height: 24,
            decoration: BoxDecoration(color: const Color(0xFF1A1F71), borderRadius: BorderRadius.circular(4)),
            child: const Center(child: Text('VISA',
                style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900))));
      case 'Pay Pal':
        return Container(width: 36, height: 24,
            decoration: BoxDecoration(color: const Color(0xFF003087), borderRadius: BorderRadius.circular(4)),
            child: const Center(child: Text('PP',
                style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900))));
      default:
        return SizedBox(width: 36, height: 24,
          child: Stack(children: [
            Positioned(left: 0, child: Container(width: 22, height: 22,
                decoration: const BoxDecoration(color: Color(0xFFEB001B), shape: BoxShape.circle))),
            Positioned(right: 0, child: Container(width: 22, height: 22,
                decoration: BoxDecoration(color: const Color(0xFFF79E1B).withOpacity(0.9), shape: BoxShape.circle))),
          ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(Icons.check_circle, size: 14, color: AppColors.success),
                const SizedBox(width: 6),
                Text('Verified Payment Account',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              ]),
              _icon,
            ],
          ),
          const SizedBox(height: 10),
          Text(card.maskedNumber,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                  color: Colors.black87, letterSpacing: 1.2)),
          const SizedBox(height: 4),
          Text(card.type,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: Text('Edit Account',
                style: TextStyle(fontSize: 12, color: AppColors.success, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

// ── Dialog Field ──────────────────────────────────────────────────────────────
class _DialogField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const _DialogField({required this.label, required this.hint,
      required this.controller, this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
        const SizedBox(height: 6),
        TextField(
          controller: controller, keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hint, hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
            filled: true, fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5)),
          ),
        ),
      ],
    );
  }
}

// ── Model ─────────────────────────────────────────────────────────────────────
class _PaymentCard {
  final String name;
  final String type;
  final String maskedNumber;
  final bool isPrimary;
  const _PaymentCard({required this.name, required this.type,
      required this.maskedNumber, required this.isPrimary});
}