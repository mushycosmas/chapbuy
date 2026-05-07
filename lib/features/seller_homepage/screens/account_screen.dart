import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Nelson Doe',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'nelson.doe@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.cardBgGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Verified Seller',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.success,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Stats Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatColumn(value: '45', label: 'Products'),
                  _StatColumn(value: '127', label: 'Orders'),
                  _StatColumn(value: '4.8', label: 'Rating'),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Menu Items
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.store_outlined,
                    title: 'My Store',
                    subtitle: 'Manage your store profile',
                    onTap: () {},
                    showBadge: false,
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.inventory_2_outlined,
                    title: 'Products',
                    subtitle: 'Manage your products inventory',
                    onTap: () {},
                    showBadge: true,
                    badgeCount: '3',
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.payments_outlined,
                    title: 'Payouts',
                    subtitle: '\$450,000 available balance',
                    onTap: () {},
                    showBadge: false,
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.receipt_long_outlined,
                    title: 'Transaction History',
                    subtitle: 'View all your transactions',
                    onTap: () {},
                    showBadge: false,
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Shipping Addresses',
                    subtitle: 'Manage delivery addresses',
                    onTap: () {},
                    showBadge: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Support & Legal Section
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.headphones_outlined,
                    title: 'Customer Support',
                    subtitle: 'Get help 24/7',
                    onTap: () {},
                    showBadge: false,
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.help_outline,
                    title: 'FAQ',
                    subtitle: 'Frequently asked questions',
                    onTap: () {},
                    showBadge: false,
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.description_outlined,
                    title: 'Terms & Conditions',
                    subtitle: 'Legal information',
                    onTap: () {},
                    showBadge: false,
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    subtitle: 'How we protect your data',
                    onTap: () {},
                    showBadge: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Logout Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Add logout logic here
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Log Out'),
          ),
        ],
      );
    },
  );
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showBadge;
  final String? badgeCount;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showBadge = false,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primaryBlue),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBadge && badgeCount != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badgeCount!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }
}