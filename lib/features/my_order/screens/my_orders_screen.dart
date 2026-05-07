import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../seller_homepage/screens/active_order_detail_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _activeFilter = 0; // 0=All,1=Shipped,2=Processing,3=Inspected,4=Completed,5=Cancelled

  final List<_Order> _allOrders = [
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Inspected',   statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Inspected',   statusDot: _DotType.orange, date: 'Jan 5, 2024', escrowText: 'Payment Released'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Processing',  statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Completed',   statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Cancelled',   statusDot: _DotType.grey,   date: 'Jan 5, 2024', escrowText: 'Cancelled'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Shipped',     statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Processing',  statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Completed',   statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Cancelled',   statusDot: _DotType.grey,   date: 'Jan 5, 2024', escrowText: 'Cancelled'),
    _Order(product: 'White Maize', orderId: 'ORD-2024-001', buyer: 'Global Grains Ltd', location: 'Lusaka, Zambia', quantity: '50 MT', totalAmount: '\$12,500', status: 'Shipped',     statusDot: _DotType.green,  date: 'Jan 5, 2024', escrowText: 'Secured in Escrow'),
  ];

  final List<String> _filters = ['All', 'Shipped', 'Processing', 'Inspected', 'Completed', 'Cancelled'];

  List<_Order> get _filtered {
    if (_activeFilter == 0) return _allOrders;
    final label = _filters[_activeFilter];
    return _allOrders.where((o) => o.status == label).toList();
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
                    child: Icon(
                      Icons.chevron_left,
                      size: 28,
                      color: Navigator.canPop(context) ? Colors.black87 : Colors.transparent,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'My Orders',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),

            // ── Filter Tabs (horizontal scroll) ───────────────────────────
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final isActive = _activeFilter == index;
                  return GestureDetector(
                    onTap: () => setState(() => _activeFilter = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.success
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isActive
                              ? Colors.white
                              : Colors.grey.shade500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // ── Order List ────────────────────────────────────────────────
            Expanded(
              child: _filtered.isEmpty
                  ? Center(
                      child: Text(
                        'No orders found',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade400),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _OrderCard(
                            order: _filtered[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ActiveOrderDetailScreen(
                                    productName: _filtered[index].product,
                                    buyer: _filtered[index].buyer,
                                    details: '\${_filtered[index].quantity} · \${_filtered[index].totalAmount}',
                                    orderType: _filtered[index].status == 'Completed'
                                        ? OrderDetailType.completed
                                        : _filtered[index].status == 'Cancelled'
                                            ? OrderDetailType.cancelled
                                            : OrderDetailType.active,
                                  ),
                                ),
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

// ── Order Card ────────────────────────────────────────────────────────────────
class _OrderCard extends StatelessWidget {
  final _Order order;
  final VoidCallback onTap;

  const _OrderCard({required this.order, required this.onTap});

  Color get _badgeColor {
    switch (order.status) {
      case 'Shipped':    return AppColors.primaryBlue;
      case 'Processing': return AppColors.warning;
      case 'Inspected':  return AppColors.purple;
      case 'Completed':  return AppColors.success;
      case 'Cancelled':  return AppColors.error;
      default:           return Colors.grey;
    }
  }

  Color get _badgeBgColor {
    switch (order.status) {
      case 'Shipped':    return AppColors.cardBgBlue;
      case 'Processing': return AppColors.cardBgOrange;
      case 'Inspected':  return AppColors.cardBgPurple;
      case 'Completed':  return AppColors.cardBgGreen;
      case 'Cancelled':  return AppColors.cardBgRed;
      default:           return Colors.grey.shade100;
    }
  }

  Color get _dotColor {
    switch (order.statusDot) {
      case _DotType.green:  return AppColors.success;
      case _DotType.orange: return AppColors.warning;
      case _DotType.grey:   return Colors.grey.shade400;
    }
  }

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
            // ── Product + badge ───────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.product,
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
                    color: _badgeBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: _badgeColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),

            // ── Order ID ──────────────────────────────────────────────────
            Text(
              order.orderId,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 8),

            // ── Buyer + location ──────────────────────────────────────────
            Text(
              order.buyer,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            Text(
              order.location,
              style:
                  TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 10),

            // ── Quantity + Total ──────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quantity',
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade500)),
                    const SizedBox(height: 2),
                    Text(order.quantity,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Total Amount',
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade500)),
                    const SizedBox(height: 2),
                    Text(order.totalAmount,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // ── Status dot + escrow text + date ───────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      order.escrowText,
                      style: TextStyle(
                        fontSize: 12,
                        color: _dotColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  order.date,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.shade400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────
enum _DotType { green, orange, grey }

class _Order {
  final String product;
  final String orderId;
  final String buyer;
  final String location;
  final String quantity;
  final String totalAmount;
  final String status;
  final _DotType statusDot;
  final String date;
  final String escrowText;

  const _Order({
    required this.product,
    required this.orderId,
    required this.buyer,
    required this.location,
    required this.quantity,
    required this.totalAmount,
    required this.status,
    required this.statusDot,
    required this.date,
    required this.escrowText,
  });
}