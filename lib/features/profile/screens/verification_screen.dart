import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

// ── Verification Entry Screen ─────────────────────────────────────────────────
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text('Verification Documents',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBgGreen,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.shield_outlined, color: AppColors.success, size: 20),
                              const SizedBox(width: 8),
                              const Text('Benefits of Full Verification',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                            ],
                          ),
                          const SizedBox(height: 14),
                          ...[
                            'Verified badge on your seller profile',
                            'Higher search ranking and visibility',
                            'Increased buyer trust and conversion rates',
                            'Access to premium features and tools',
                            'Priority customer support',
                          ].map((b) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle, color: AppColors.success, size: 16),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(b,
                                      style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.3)),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text('Next Steps to Premium Verification',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 16),
                    _NextStep(number: '1', title: 'Upload ID',
                        subtitle: 'Export license and agricultural permit under review'),
                    _NextStep(number: '2', title: 'Selfie + liveness',
                        subtitle: 'Export license and agricultural permit under review'),
                    _NextStep(number: '3', title: 'Consent & summary',
                        subtitle: 'Export license and agricultural permit under review', isLast: true),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const VerificationUploadScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Get Started',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text("I'll do it later",
                            style: TextStyle(fontSize: 14, color: AppColors.success, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 24),
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

class _NextStep extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final bool isLast;
  const _NextStep({required this.number, required this.title, required this.subtitle, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.15), shape: BoxShape.circle),
              child: Center(
                child: Text(number, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.warning)),
              ),
            ),
            if (!isLast) Container(width: 2, height: 32, color: Colors.grey.shade200),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
                const SizedBox(height: 3),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade500, height: 1.4)),
                SizedBox(height: isLast ? 0 : 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Verification Upload Screen (Step 1) ───────────────────────────────────────
class VerificationUploadScreen extends StatefulWidget {
  const VerificationUploadScreen({super.key});

  @override
  State<VerificationUploadScreen> createState() => _VerificationUploadScreenState();
}

class _VerificationUploadScreenState extends State<VerificationUploadScreen> {
  String _selected = 'camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _VerifHeader(title: 'Verification Documents', onBack: () => Navigator.pop(context)),
            _StepIndicator(currentStep: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Step 1: Upload ID',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 6),
                    Text('To verify your identity, please upload a clear photo of your government-issued ID.',
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.4)),
                    const SizedBox(height: 20),

                    // Use Camera
                    GestureDetector(
                      onTap: () => setState(() => _selected = 'camera'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                          color: _selected == 'camera' ? AppColors.success.withOpacity(0.05) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _selected == 'camera' ? AppColors.success : Colors.grey.shade200,
                            width: _selected == 'camera' ? 1.5 : 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Radio top-right
                            Positioned(
                              top: 0, right: 0,
                              child: Container(
                                width: 20, height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _selected == 'camera' ? AppColors.success : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  color: _selected == 'camera' ? AppColors.success : Colors.transparent,
                                ),
                                child: _selected == 'camera'
                                    ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
                              ),
                            ),
                            // Icon + text centered
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 52, height: 52,
                                    decoration: BoxDecoration(
                                      color: _selected == 'camera' ? AppColors.success.withOpacity(0.1) : Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.camera_alt_outlined, size: 24,
                                        color: _selected == 'camera' ? AppColors.success : Colors.grey.shade400),
                                  ),
                                  const SizedBox(height: 10),
                                  Text('Use Camera',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                                          color: _selected == 'camera' ? Colors.black87 : Colors.black54)),
                                  const SizedBox(height: 4),
                                  Text('Capture a photo using your device camera.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Upload Photo
                    GestureDetector(
                      onTap: () => setState(() => _selected = 'upload'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                          color: _selected == 'upload' ? AppColors.success.withOpacity(0.05) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _selected == 'upload' ? AppColors.success : Colors.grey.shade200,
                            width: _selected == 'upload' ? 1.5 : 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0, right: 0,
                              child: Container(
                                width: 20, height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _selected == 'upload' ? AppColors.success : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  color: _selected == 'upload' ? AppColors.success : Colors.transparent,
                                ),
                                child: _selected == 'upload'
                                    ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 52, height: 52,
                                    decoration: BoxDecoration(
                                      color: _selected == 'upload' ? AppColors.success.withOpacity(0.1) : Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.upload_file_outlined, size: 24,
                                        color: _selected == 'upload' ? AppColors.success : Colors.grey.shade400),
                                  ),
                                  const SizedBox(height: 10),
                                  Text('Upload Photo',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                                          color: _selected == 'upload' ? Colors.black87 : Colors.black54)),
                                  const SizedBox(height: 4),
                                  Text('Select a photo from your gallery.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // We accept
                    const Text('We accept the following IDs',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 4),
                    Text('Choose a valid ID from the list below to complete your verification.',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        _IdChip(icon: Icons.badge_outlined, label: "Driver's License"),
                        const SizedBox(width: 8),
                        _IdChip(icon: Icons.book_outlined, label: 'Passport'),
                        const SizedBox(width: 8),
                        _IdChip(icon: Icons.credit_card_outlined, label: 'National ID'),
                      ],
                    ),
                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const DocumentCameraScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Continue',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 24),
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

class _IdChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IdChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(color: AppColors.cardBgGreen, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: AppColors.success),
            const SizedBox(width: 6),
            Flexible(
              child: Text(label, textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87)),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Document Camera Screen ────────────────────────────────────────────────────
class DocumentCameraScreen extends StatelessWidget {
  const DocumentCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                GestureDetector(onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.white)),
              ]),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text('Position the front of your\ndocument in this frame',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14)),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const IdPhotoConfirmScreen())),
                    child: Container(
                      width: 64, height: 64,
                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3)),
                      child: const Icon(Icons.camera_alt, color: Colors.black, size: 28),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.verified_user_outlined, size: 14, color: Colors.white.withOpacity(0.6)),
                    const SizedBox(width: 4),
                    Text('Secure identity', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── ID Photo Confirm Screen ───────────────────────────────────────────────────
class IdPhotoConfirmScreen extends StatelessWidget {
  const IdPhotoConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _VerifHeader(title: 'Verification Documents', onBack: () => Navigator.pop(context)),
            _StepIndicator(currentStep: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/federal.png',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey.shade800,
                          ),
                          child: Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Icon(Icons.credit_card, size: 60, color: Colors.white.withOpacity(0.3)),
                              const SizedBox(height: 8),
                              Text('FEDERAL REPUBLIC',
                                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12, fontWeight: FontWeight.w700)),
                              Text('5396 2678 4245 0679',
                                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11)),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SelfieScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success, elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Use Photo',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Retake photo', style: TextStyle(fontSize: 15, color: Colors.black54)),
                      ),
                    ),
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

// ── Selfie Screen ─────────────────────────────────────────────────────────────
class SelfieScreen extends StatelessWidget {
  const SelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _VerifHeader(title: 'Verification Documents', onBack: () => Navigator.pop(context)),
            _StepIndicator(currentStep: 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Time for a selfie',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 8),
                    Text('This will complete against the document you provided.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
                    const SizedBox(height: 24),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SelfieCameraScreen())),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.success.withOpacity(0.3), width: 2),
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.cardBgGreen,
                          ),
                          child: Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Icon(Icons.face_outlined, size: 80, color: AppColors.success.withOpacity(0.4)),
                              const SizedBox(height: 16),
                              Text('Tap to take selfie',
                                  style: TextStyle(fontSize: 14, color: AppColors.success.withOpacity(0.7))),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity, height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SelfieCameraScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success, elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Take Selfie',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
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

// ── Selfie Camera Screen ──────────────────────────────────────────────────────
class SelfieCameraScreen extends StatelessWidget {
  const SelfieCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                GestureDetector(onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.white)),
              ]),
            ),
            const Spacer(),
            Container(
              width: 220, height: 280,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(130),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(130),
                child: Container(color: Colors.black54,
                    child: const Icon(Icons.person, size: 120, color: Colors.white30)),
              ),
            ),
            const SizedBox(height: 20),
            Text('Please keep your face still\nand within the oval frame',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, height: 1.5)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SelfieResultScreen())),
                    child: Container(
                      width: 64, height: 64,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.camera_alt, color: Colors.black, size: 28),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.verified_user_outlined, size: 14, color: Colors.white.withOpacity(0.6)),
                    const SizedBox(width: 4),
                    Text('Secure identity', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Selfie Result Screen (photo + oval + Use Photo / Retake) ──────────────────
class SelfieResultScreen extends StatelessWidget {
  const SelfieResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.white),
                  ),
                  const Expanded(
                    child: Text('Verification Documents',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),

            // Full photo with dotted oval overlay
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background photo (simulated with grey)
                  Container(
                    width: double.infinity,
                    color: Colors.grey.shade700,
                    child: const Icon(Icons.person, size: 200, color: Colors.white24),
                  ),
                  // Dotted oval overlay
                  CustomPaint(
                    painter: _DottedOvalPainter(),
                    child: const SizedBox(width: 240, height: 300),
                  ),
                ],
              ),
            ),

            // Buttons
            Container(
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const VerificationResultScreen(isSuccess: false))),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success, elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Use Photo',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text('Retake photo',
                        style: TextStyle(fontSize: 14, color: AppColors.success, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DottedOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final tangent = metric.getTangentForOffset(distance);
        if (tangent != null) canvas.drawCircle(tangent.position, 2.5, paint);
        distance += 10;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ── Verification Result Screen ────────────────────────────────────────────────
class VerificationResultScreen extends StatelessWidget {
  final bool isSuccess;
  const VerificationResultScreen({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _VerifHeader(title: 'Verification Documents', onBack: () => Navigator.pop(context)),
            _StepIndicator(currentStep: isSuccess ? 3 : 2),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: isSuccess ? _SuccessContent(context) : _FailContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _FailContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        // Red warning icon
        Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 28),
        ),
        const SizedBox(height: 16),
        Text('Verification Unsuccessful',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.error)),
        const SizedBox(height: 8),
        Text(
          "We couldn't verify your selfie with the liveness check.\nPlease review the tips below and try again.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5),
        ),
        const SizedBox(height: 24),
        _TipItem(icon: Icons.wb_sunny_outlined, label: 'Lightning',
            detail: 'Make sure you\'re in a well-lit room without bright lights behind you.'),
        _TipItem(icon: Icons.crop_free, label: 'Framing',
            detail: 'Center your face in the oval and hold your device still.'),
        _TipItem(icon: Icons.lens_blur, label: 'Clarity',
            detail: 'Ensure the camera lens and clean the image is not blurry.'),
        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity, height: 50,
          child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const VerificationConsentScreen())),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success, elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Try Again',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _SuccessContent(BuildContext context) => const SizedBox();
}

// ── Verification Consent Screen ───────────────────────────────────────────────
class VerificationConsentScreen extends StatefulWidget {
  const VerificationConsentScreen({super.key});

  @override
  State<VerificationConsentScreen> createState() => _VerificationConsentScreenState();
}

class _VerificationConsentScreenState extends State<VerificationConsentScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _VerifHeader(title: 'Verification Documents', onBack: () => Navigator.pop(context)),
            _StepIndicator(currentStep: 3),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Final Step: Consent & Summary',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 4),
                    Text('Please review the following information before submitting your verification.',
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.4)),
                    const SizedBox(height: 20),

                    // Verification cards
                    _VerifCard(
                      icon: Icons.shield_outlined,
                      iconColor: AppColors.success,
                      title: 'Document Authenticity',
                      subtitle: 'We verify that your submitted documents are genuine and not tampered with.',
                    ),
                    const SizedBox(height: 10),
                    _VerifCard(
                      icon: Icons.face_outlined,
                      iconColor: AppColors.primaryBlue,
                      title: 'Face Match',
                      subtitle: 'We compare your photo with the one on your ID to confirm your identity.',
                    ),
                    const SizedBox(height: 10),
                    _VerifCard(
                      icon: Icons.verified_outlined,
                      iconColor: AppColors.success,
                      title: 'Document Authenticity',
                      subtitle: 'We verify that your submitted documents are genuine and not tampered with.',
                    ),
                    const SizedBox(height: 20),

                    // Privacy box
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Your Privacy is Important',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black87)),
                          const SizedBox(height: 8),
                          Text(
                            'We value your trust and take your privacy seriously. Every transaction, message, and document shared on our platform is protected with advanced encryption and strict confidentiality standards. Your personal and business data will never be shared with third parties without your consent. We collect only the information necessary to verify suppliers, process orders, and ensure secure payments. You remain in full control of your data — with easy access to view, manage, or delete your information at any time.',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Checkbox
                    GestureDetector(
                      onTap: () => setState(() => _agreed = !_agreed),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _agreed,
                            onChanged: (v) => setState(() => _agreed = v!),
                            activeColor: AppColors.success,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'I have read and agree to the verification checks and the data policy.',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity, height: 52,
                      child: ElevatedButton(
                        onPressed: _agreed
                            ? () => Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const VerificationSuccessScreen()))
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          disabledBackgroundColor: Colors.grey.shade300,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Continue',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 24),
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

// ── Verification Success Screen ───────────────────────────────────────────────
class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _VerifHeader(title: 'Verification Documents', onBack: () => Navigator.pop(context)),
            _StepIndicator(currentStep: 3),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    // Green check icon
                    Container(
                      width: 72, height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 52, height: 52,
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: AppColors.success, size: 28),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Verification Successful',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 8),
                    Text(
                      'Congratulations! Your seller account has been successfully verified. You now have access to powerful new features to help you grow.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5),
                    ),
                    const SizedBox(height: 28),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text("Here's what you've unlocked",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                    ),
                    const SizedBox(height: 14),

                    _UnlockCard(
                      icon: Icons.flash_on_outlined,
                      iconColor: AppColors.warning,
                      title: 'Faster Payouts',
                      subtitle: 'Your payouts will now be processed up to 2x faster.',
                    ),
                    const SizedBox(height: 10),
                    _UnlockCard(
                      icon: Icons.verified_outlined,
                      iconColor: AppColors.primaryBlue,
                      title: 'Verified Seller Badge',
                      subtitle: 'A badge will be added to your profile which will increase buyer trust and visibility.',
                    ),
                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity, height: 52,
                      child: ElevatedButton(
                        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success, elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Done',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 24),
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

// ── Helper Widgets ────────────────────────────────────────────────────────────
class _TipItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String detail;
  const _TipItem({required this.icon, required this.label, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade500),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                const SizedBox(height: 3),
                Text(detail, style: TextStyle(fontSize: 12, color: Colors.grey.shade500, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerifCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  const _VerifCard({required this.icon, required this.iconColor, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(subtitle, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500, height: 1.4)),
        ],
      ),
    );
  }
}

class _UnlockCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  const _UnlockCard({required this.icon, required this.iconColor, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(subtitle, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Shared Widgets ────────────────────────────────────────────────────────────
class _VerifHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  const _VerifHeader({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(children: [
        GestureDetector(onTap: onBack, child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87)),
        Expanded(child: Text(title, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87))),
        const SizedBox(width: 28),
      ]),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  const _StepIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ['Upload ID', 'Selfie + liveness', 'Consent & summary'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (i) {
          if (i.isOdd) {
            return Expanded(child: Container(height: 2,
                color: i ~/ 2 < currentStep - 1 ? AppColors.success : Colors.grey.shade200));
          }
          final idx = i ~/ 2;
          final isActive = idx == currentStep - 1;
          final isDone = idx < currentStep - 1;
          return Column(children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(
                color: isDone || isActive ? AppColors.success : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isDone
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : Text('${idx + 1}', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700,
                    color: isActive ? Colors.white : Colors.grey.shade500)),
              ),
            ),
            const SizedBox(height: 4),
            Text(steps[idx], style: TextStyle(fontSize: 9,
                color: isActive ? AppColors.success : Colors.grey.shade400,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal)),
          ]);
        }),
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String label;
  final String detail;
  final bool? passed;
  const _CheckItem({required this.label, required this.detail, required this.passed});

  @override
  Widget build(BuildContext context) {
    final color = passed == null ? Colors.grey : passed! ? AppColors.success : AppColors.error;
    final icon = passed == null ? Icons.info_outline : passed! ? Icons.check_circle : Icons.cancel;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
          Text(detail, style: TextStyle(fontSize: 11, color: Colors.grey.shade500, height: 1.4)),
        ])),
      ]),
    );
  }
}