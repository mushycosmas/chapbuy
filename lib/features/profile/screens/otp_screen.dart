import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'create_password_screen.dart';

enum OtpType { email, phone }

class OtpScreen extends StatefulWidget {
  final OtpType type;
  const OtpScreen({super.key, required this.type});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  int _secondsLeft = 120; // 2:00
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 0) { t.cancel(); return; }
      setState(() => _secondsLeft--);
    });
  }

  String get _timerText {
    final m = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmail = widget.type == OtpType.email;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              Text(isEmail ? 'Check your email' : 'Check your phone',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5),
                  children: [
                    TextSpan(text: isEmail
                        ? 'We sent an OTP to your email\n'
                        : 'We sent an OTP to your phone\n'),
                    TextSpan(
                      text: isEmail ? 'nelson1234@gmail.com' : '+234 902 7293 293',
                      style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: isEmail ? 'Change email' : 'Change phone',
                      style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // ── 6 OTP boxes with dash separator ──────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First 3 boxes
                  ...List.generate(3, (i) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _OtpBox(
                      controller: _controllers[i],
                      focusNode: _focusNodes[i],
                      onChanged: (v) {
                        if (v.isNotEmpty && i < 5) _focusNodes[i + 1].requestFocus();
                        if (v.isEmpty && i > 0) _focusNodes[i - 1].requestFocus();
                      },
                    ),
                  )),
                  // Dash separator
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text('—', style: TextStyle(fontSize: 18, color: Colors.grey.shade400)),
                  ),
                  // Last 3 boxes
                  ...List.generate(3, (i) => Padding(
                    padding: EdgeInsets.only(left: i == 0 ? 4 : 0, right: i < 2 ? 6 : 0),
                    child: _OtpBox(
                      controller: _controllers[i + 3],
                      focusNode: _focusNodes[i + 3],
                      onChanged: (v) {
                        if (v.isNotEmpty && (i + 3) < 5) _focusNodes[i + 4].requestFocus();
                        if (v.isEmpty && (i + 3) > 0) _focusNodes[i + 2].requestFocus();
                      },
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 20),

              // Resend timer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                      children: [
                        const TextSpan(text: 'Resend Code In: '),
                        TextSpan(
                          text: _timerText,
                          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  if (_secondsLeft == 0)
                    GestureDetector(
                      onTap: () => setState(() { _secondsLeft = 120; _startTimer(); }),
                      child: const Text('Resend OTP',
                          style: TextStyle(fontSize: 13, color: AppColors.success, fontWeight: FontWeight.w600)),
                    ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity, height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CreatePasswordScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Verify OTP',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const _OtpBox({required this.controller, required this.focusNode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44, height: 52,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: EdgeInsets.zero,
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
            borderSide: const BorderSide(color: AppColors.success, width: 2),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}