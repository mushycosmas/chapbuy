import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'notifications_screen.dart';
import 'rfq_detail_screen.dart';
import 'messages_screen.dart';
import 'product_request_screen.dart';

class HomeSellerScreen extends StatefulWidget {
  const HomeSellerScreen({super.key});

  @override
  State<HomeSellerScreen> createState() => _HomeSellerScreenState();
}

class _HomeSellerScreenState extends State<HomeSellerScreen> {
  // 0 = Pending RFQs, 1 = Active Orders
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top bar ──────────────────────────────────────────────────
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.primaryBlue.withOpacity(0.15),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.primaryBlue,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nelson Doe,',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined,
                            color: Colors.black87),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationsScreen(),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Colors.black87),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MessagesScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Hero Stats Card ───────────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Revenue (Paid)',
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '\$450,000',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _MiniStat(
                          value: '17',
                          label: 'Active Orders',
                          bgColor: Colors.white.withOpacity(0.2),
                          valueColor: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        _MiniStat(
                          value: '17',
                          label: 'Pending RFQs',
                          bgColor: Colors.white.withOpacity(0.2),
                          valueColor: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        _MiniStat(
                          value: '5',
                          label: 'My orders',
                          bgColor: Colors.white.withOpacity(0.2),
                          valueColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ── Quick Actions ─────────────────────────────────────────────
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _QuickActionButton(
                      icon: Icons.add_circle_outline,
                      label: 'Upload Product',
                      color: Colors.white,
                      bgColor: AppColors.teal,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickActionButton(
                      icon: Icons.local_offer_outlined,
                      label: 'Create Fast Trade',
                      color: Colors.white,
                      bgColor: AppColors.warning,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // ── TAB BUTTONS: Pending RFQs / Active Orders ─────────────────
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Pending RFQs tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _activeTab = 0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            color: _activeTab == 0
                                ? AppColors.success
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Pending RFQs',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _activeTab == 0
                                  ? Colors.white
                                  : Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Active Orders tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _activeTab = 1),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            color: _activeTab == 1
                                ? AppColors.success
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Active Orders',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _activeTab == 1
                                  ? Colors.white
                                  : Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ── Section Header ────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _activeTab == 0 ? 'Pending RFQs' : 'Active Orders',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProductRequestScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.success,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // ── List content ──────────────────────────────────────────────
              if (_activeTab == 0) ..._buildPendingRfqs(context: context),
              if (_activeTab == 1) ..._buildActiveOrders(),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // ── Pending RFQs list ─────────────────────────────────────────────────────
  List<Widget> _buildPendingRfqs({required BuildContext context}) {
    final items = [
      {'product': 'White Maize', 'buyer': 'Continental Foods Ltd', 'details': '100 MT · CIF · \$280/MT', 'badge': 'Available'},
      {'product': 'White Maize', 'buyer': 'Continental Foods Ltd', 'details': '100 MT · CIF · \$280/MT', 'badge': 'Available'},
      {'product': 'White Maize', 'buyer': 'Continental Foods Ltd', 'details': '100 MT · CIF · \$280/MT', 'badge': 'Available'},
      {'product': 'White Maize', 'buyer': 'Continental Foods Ltd', 'details': '100 MT · CIF · \$280/MT', 'badge': 'Publish'},
    ];

    return items.map((item) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: _RfqCard(
        productName: item['product']!,
        buyerName: item['buyer']!,
        details: item['details']!,
        badgeText: item['badge']!,
        badgeColor: item['badge'] == 'Publish' ? AppColors.primaryBlue : AppColors.success,
        buttonText: 'Submit Quote',
        buttonColor: AppColors.primaryBlue,
        onButtonTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RfqDetailScreen(
                productName: item['product']!,
              ),
            ),
          );
        },
      ),
    )).toList();
  }

  // ── Active Orders list ────────────────────────────────────────────────────
  List<Widget> _buildActiveOrders() {
    final items = [
      {'product': 'Copper Ore', 'orderId': 'ORD-2024-001', 'details': '100 MT · \$450,000 · Shanghai, China', 'status': 'Payment secured in escrow', 'type': 'escrow'},
      {'product': 'Copper Ore', 'orderId': 'ORD-2024-002', 'details': '100 MT · \$450,000 · Shanghai, China', 'status': 'Payment secured in escrow', 'type': 'escrow'},
      {'product': 'Copper Ore', 'orderId': 'ORD-2024-003', 'details': '100 MT · \$450,000 · Shanghai, China', 'status': 'Processing', 'type': 'processing'},
      {'product': 'Copper Ore', 'orderId': 'ORD-2024-004', 'details': '100 MT · \$450,000 · Shanghai, China', 'status': 'Shipped', 'type': 'shipped'},
    ];

    return items.map((item) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: _ActiveOrderCard(
        orderId: item['orderId']!,
        productName: item['product']!,
        details: item['details']!,
        statusText: item['status']!,
        statusColor: _statusColor(item['type']!),
        statusIcon: _statusIcon(item['type']!),
        onTap: () {},
      ),
    )).toList();
  }

  Color _statusColor(String type) {
    switch (type) {
      case 'escrow': return AppColors.success;
      case 'processing': return AppColors.warning;
      case 'shipped': return AppColors.primaryBlue;
      default: return Colors.grey;
    }
  }

  IconData _statusIcon(String type) {
    switch (type) {
      case 'escrow': return Icons.security_outlined;
      case 'processing': return Icons.autorenew_outlined;
      case 'shipped': return Icons.local_shipping_outlined;
      default: return Icons.info_outline;
    }
  }
}

// ── Mini Stat ─────────────────────────────────────────────────────────────────
class _MiniStat extends StatelessWidget {
  final String value;
  final String label;
  final Color bgColor;
  final Color valueColor;

  const _MiniStat({
    required this.value,
    required this.label,
    required this.bgColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: valueColor),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: valueColor.withOpacity(0.85)),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Quick Action Button ───────────────────────────────────────────────────────
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bgColor;
  final Color? labelColor;
  final Color? iconColor;
  final VoidCallback onTap;
  final String? badge;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.bgColor,
    required this.onTap,
    this.labelColor,
    this.iconColor,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIcon = iconColor ?? color;
    final effectiveLabel = labelColor ?? color;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Icon on top, label below — fully centered
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 28, color: effectiveIcon),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: effectiveLabel,
                    ),
                  ),
                ],
              ),
            ),
            if (badge != null)
              Positioned(
                top: -8,
                right: -8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── RFQ Card ──────────────────────────────────────────────────────────────────
class _RfqCard extends StatelessWidget {
  final String productName;
  final String buyerName;
  final String details;
  final String badgeText;
  final Color badgeColor;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onButtonTap;

  const _RfqCard({
    required this.productName,
    required this.buyerName,
    required this.details,
    required this.badgeText,
    required this.badgeColor,
    required this.buttonText,
    required this.buttonColor,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // ── Top row: product name + badge ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // ── Buyer name ──
          Text(
            buyerName,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 6),
          // ── Details with dots ──
          Row(
            children: details.split(' · ').asMap().entries.map((entry) {
              final isLast = entry.key == details.split(' · ').length - 1;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  if (!isLast)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          // ── Submit Quote button: full width, light green bg, green text ──
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onButtonTap,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.success.withOpacity(0.08),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.success,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Active Order Card ─────────────────────────────────────────────────────────
class _ActiveOrderCard extends StatelessWidget {
  final String orderId;
  final String productName;
  final String details;
  final String statusText;
  final Color statusColor;
  final IconData statusIcon;
  final VoidCallback onTap;

  const _ActiveOrderCard({
    required this.orderId,
    required this.productName,
    required this.details,
    required this.statusText,
    required this.statusColor,
    required this.statusIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            // ── Top row: product name + status badge ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            // ── Order ID ──
            Text(
              orderId,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 8),
            // ── Details with dot separators ──
            Row(
              children: details.split(' · ').asMap().entries.map((entry) {
                final isLast =
                    entry.key == details.split(' · ').length - 1;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      entry.value,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    if (!isLast)
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            // ── Status dot + text ──
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}