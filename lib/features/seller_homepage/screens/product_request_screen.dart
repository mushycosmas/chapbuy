import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'rfq_detail_screen.dart';
import 'active_order_detail_screen.dart';
import 'expired_rfq_detail_screen.dart';

class ProductRequestScreen extends StatefulWidget {
  const ProductRequestScreen({super.key});

  @override
  State<ProductRequestScreen> createState() => _ProductRequestScreenState();
}

class _ProductRequestScreenState extends State<ProductRequestScreen> {
  int _activeFilter = 0;

  final List<_RfqProduct> _allItems = [
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Available'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Available'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Available'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Available'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Expired'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Expired'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Expired'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Active'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Active'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Pending'),
    _RfqProduct(product: 'White Maize', buyer: 'Continental Foods Ltd', details: '100 MT · CIF · \$280/MT', status: 'Pending'),
  ];

  List<_RfqProduct> get _filtered {
    switch (_activeFilter) {
      case 1: return _allItems.where((e) => e.status == 'Active').toList();
      case 2: return _allItems.where((e) => e.status == 'Pending').toList();
      case 3: return _allItems.where((e) => e.status == 'Expired').toList();
      default: return _allItems;
    }
  }

  int get _activeCount   => _allItems.where((e) => e.status == 'Active').length;
  int get _pendingCount  => _allItems.where((e) => e.status == 'Pending').length;
  int get _expiredCount  => _allItems.where((e) => e.status == 'Expired').length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 28,
                      color: Navigator.canPop(context)
                          ? Colors.black87
                          : Colors.transparent,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Product Request (RFQ)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 28), // balance the back arrow
                ],
              ),
            ),

            // ── Filter Tabs ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _FilterTab(
                    label: 'All',
                    count: _allItems.length,
                    isActive: _activeFilter == 0,
                    onTap: () => setState(() => _activeFilter = 0),
                  ),
                  const SizedBox(width: 8),
                  _FilterTab(
                    label: 'Active',
                    count: _activeCount,
                    isActive: _activeFilter == 1,
                    onTap: () => setState(() => _activeFilter = 1),
                  ),
                  const SizedBox(width: 8),
                  _FilterTab(
                    label: 'Pending',
                    count: _pendingCount,
                    isActive: _activeFilter == 2,
                    onTap: () => setState(() => _activeFilter = 2),
                  ),
                  const SizedBox(width: 8),
                  _FilterTab(
                    label: 'Expired',
                    count: null,
                    isActive: _activeFilter == 3,
                    onTap: () => setState(() => _activeFilter = 3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── List ─────────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final item = _filtered[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ProductRfqCard(
                      item: item,
                      onSubmitTap: () {
                        Widget screen;
                        switch (item.status) {
                          case 'Active':
                            screen = ActiveOrderDetailScreen(
                              productName: item.product,
                              buyer: item.buyer,
                              details: item.details,
                            );
                            break;
                          case 'Expired':
                            screen = ExpiredRfqDetailScreen(
                              productName: item.product,
                              buyerCompany: item.buyer,
                            );
                            break;
                          default: // Available, Pending
                            screen = RfqDetailScreen(
                              productName: item.product,
                            );
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => screen),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Filter Tab ────────────────────────────────────────────────────────────────
class _FilterTab extends StatelessWidget {
  final String label;
  final int? count;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = count != null ? '$label $count' : label;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.success : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          displayText,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}

// ── Product RFQ Card ──────────────────────────────────────────────────────────
class _ProductRfqCard extends StatelessWidget {
  final _RfqProduct item;
  final VoidCallback onSubmitTap;

  const _ProductRfqCard({required this.item, required this.onSubmitTap});

  Color get _badgeColor {
    switch (item.status) {
      case 'Available': return AppColors.primaryBlue;
      case 'Active':    return AppColors.success;
      case 'Pending':   return AppColors.warning;
      case 'Expired':   return AppColors.error;
      default:          return Colors.grey;
    }
  }

  Color get _badgeBgColor {
    switch (item.status) {
      case 'Available': return AppColors.cardBgBlue;
      case 'Active':    return AppColors.success.withOpacity(0.1);
      case 'Pending':   return AppColors.warning.withOpacity(0.1);
      case 'Expired':   return AppColors.cardBgRed;
      default:          return Colors.grey.shade100;
    }
  }

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
          // ── Top row: name + badge ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _badgeBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: _badgeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // ── Buyer ──
          Text(
            item.buyer,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 6),

          // ── Details with dot separators ──
          Row(
            children: item.details.split(' · ').asMap().entries.map((entry) {
              final isLast = entry.key == item.details.split(' · ').length - 1;
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

          // ── Submit Quote button ──
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onSubmitTap,
              style: TextButton.styleFrom(
                backgroundColor: item.status == 'Expired'
                    ? AppColors.cardBgRed
                    : item.status == 'Active'
                        ? AppColors.primaryBlue.withOpacity(0.08)
                        : AppColors.success.withOpacity(0.08),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                item.status == 'Active'
                    ? 'View Order'
                    : item.status == 'Expired'
                        ? 'View Details'
                        : 'Submit Quote',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: item.status == 'Expired'
                      ? AppColors.error
                      : AppColors.success,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────
class _RfqProduct {
  final String product;
  final String buyer;
  final String details;
  final String status;

  const _RfqProduct({
    required this.product,
    required this.buyer,
    required this.details,
    required this.status,
  });
}