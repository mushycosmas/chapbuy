import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'forgot_password_screen.dart';
import 'account_settings_screen.dart';
import 'verification_screen.dart';
import 'manage_notification_screen.dart';
import 'payment_methods_screen.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ── Header ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('Profile',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // ── Avatar + Name ───────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.primaryBlue.withOpacity(0.15),
                          child: const Icon(Icons.person, size: 40, color: AppColors.primaryBlue),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.camera_alt, size: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('John Walker',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {},
                      child: Text('Manage your account and preferences',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                    ),
                  ],
                ),
              ),

              // ── Menu Items ──────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _ProfileMenuItem(
                      icon: Icons.settings_outlined,
                      label: 'Account Settings',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountSettingsScreen())),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.inventory_2_outlined,
                      label: 'Product Listing',
                      onTap: () {},
                    ),
                    _ProfileMenuItem(
                      icon: Icons.verified_outlined,
                      label: 'Verification',
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Needs attention',
                            style: TextStyle(fontSize: 10, color: AppColors.error, fontWeight: FontWeight.w600)),
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationScreen())),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.notifications_outlined,
                      label: 'Manage Notification',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageNotificationScreen())),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.payment_outlined,
                      label: 'Payment Methods',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodsScreen())),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.lock_outline,
                      label: 'Change Password',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())),
                    ),
                    const SizedBox(height: 8),
                    _ProfileMenuItem(
                      icon: Icons.logout,
                      label: 'Log Out',
                      labelColor: AppColors.error,
                      iconColor: AppColors.error,
                      bgColor: AppColors.error.withOpacity(0.05),
                      onTap: () => _showLogoutDialog(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Confirmation Logout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 12),
              Text(
                'Are you sure you want to log out of your account? Check again and confirm your action is intentional.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500, height: 1.5),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? labelColor;
  final Color? iconColor;
  final Color? bgColor;
  final Widget? trailing;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.labelColor,
    this.iconColor,
    this.bgColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? Colors.black54),
            const SizedBox(width: 14),
            Expanded(
              child: Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: labelColor ?? Colors.black87)),
            ),
            trailing ?? Icon(Icons.chevron_right, size: 20, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}