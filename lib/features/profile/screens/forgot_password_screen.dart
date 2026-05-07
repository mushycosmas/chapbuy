import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'otp_screen.dart';

// ── Screen 2: Email ───────────────────────────────────────────────────────────
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              const Text('Forgot Password?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 6),
              Text('No worries, we\'ll send you reset instructions\nto your email.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5)),
              const SizedBox(height: 24),

              const Text('Email Address',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
              const SizedBox(height: 6),
              _InputField(
                controller: _emailController,
                hint: 'Enter Email Address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),

              // Reset Password button
              SizedBox(
                width: double.infinity, height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OtpScreen(type: OtpType.email))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Reset Password',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              // Try another way
              _TryAnotherWay(
                isOpen: _showOptions,
                onToggle: () => setState(() => _showOptions = !_showOptions),
                onSelectSms: () { setState(() => _showOptions = false);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordPhoneScreen())); },
                onSelectWhatsapp: () { setState(() => _showOptions = false);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordPhoneScreen())); },
                onSelectEmail: () { setState(() => _showOptions = false);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen(type: OtpType.email))); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Screen 3: Phone ───────────────────────────────────────────────────────────
class ForgotPasswordPhoneScreen extends StatefulWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  State<ForgotPasswordPhoneScreen> createState() => _ForgotPasswordPhoneScreenState();
}

class _ForgotPasswordPhoneScreenState extends State<ForgotPasswordPhoneScreen> {
  final _phoneController = TextEditingController();
  bool _showOptions = false;
  String _flag = '🇺🇸';
  String _code = '+1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              const Text('Forgot Password?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 6),
              Text('No worries, we\'ll send you reset instructions\nto your email.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5)),
              const SizedBox(height: 24),

              const Text('Phone number',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
              const SizedBox(height: 6),

              Row(
                children: [
                  // Flag + code
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          Text(_flag, style: const TextStyle(fontSize: 16)),
                          const SizedBox(width: 4),
                          Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey.shade500),
                          const SizedBox(width: 4),
                          Text(_code, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _InputField(
                      controller: _phoneController,
                      hint: '',
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity, height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OtpScreen(type: OtpType.phone))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Reset Password',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              _TryAnotherWay(
                isOpen: _showOptions,
                onToggle: () => setState(() => _showOptions = !_showOptions),
                onSelectSms: () { setState(() => _showOptions = false);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen(type: OtpType.phone))); },
                onSelectWhatsapp: () { setState(() => _showOptions = false);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen(type: OtpType.phone))); },
                onSelectEmail: () { setState(() => _showOptions = false);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen(type: OtpType.email))); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Shared Widgets ────────────────────────────────────────────────────────────
class _TryAnotherWay extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onToggle;
  final VoidCallback onSelectSms;
  final VoidCallback onSelectWhatsapp;
  final VoidCallback onSelectEmail;

  const _TryAnotherWay({
    required this.isOpen,
    required this.onToggle,
    required this.onSelectSms,
    required this.onSelectWhatsapp,
    required this.onSelectEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.08),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft: Radius.circular(isOpen ? 0 : 10),
                bottomRight: Radius.circular(isOpen ? 0 : 10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Try another way',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.success)),
                Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.success, size: 20),
              ],
            ),
          ),
        ),
        if (isOpen)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6, offset: const Offset(0, 3))],
            ),
            child: Column(
              children: [
                _OptionRow(label: 'Receive code by SMS', onTap: onSelectSms, showDivider: true),
                _OptionRow(label: 'Receive code by WhatsApp', onTap: onSelectWhatsapp, showDivider: true),
                _OptionRow(label: 'Receive code by Email', onTap: onSelectEmail, showDivider: false),
              ],
            ),
          ),
      ],
    );
  }
}

class _OptionRow extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool showDivider;
  const _OptionRow({required this.label, required this.onTap, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: showDivider
            ? BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100)))
            : null,
        child: Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  const _InputField({required this.controller, required this.hint, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 13),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
        filled: true, fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5)),
      ),
    );
  }
}