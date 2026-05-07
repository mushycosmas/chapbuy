import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

enum OrderDetailType { active, completed, cancelled }

class ActiveOrderDetailScreen extends StatelessWidget {
  final String orderId;
  final String productName;
  final String buyer;
  final String details;
  final OrderDetailType orderType;

  const ActiveOrderDetailScreen({
    super.key,
    this.orderId = 'ORD-2024-001',
    this.productName = 'White Maize',
    this.buyer = 'Global Grains Ltd',
    this.details = '50 MT · \$12,500',
    this.orderType = OrderDetailType.active,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ───────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text(
                      'ORD-2024-001',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87),
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
                    // ── Product Card ──────────────────────────────────────
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productName,
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87)),
                                  const SizedBox(height: 3),
                                  Text('50 MT', style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
                                  Text('\$250.00/MT', style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
                                ],
                              ),
                              const Text('\$12,500',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.success)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Buyer Information ─────────────────────────────────
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Buyer Information', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(buyer, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                                  const SizedBox(height: 2),
                                  Text('James Banda', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined, size: 13, color: Colors.grey.shade400),
                                      const SizedBox(width: 3),
                                      Text('Lusaka, Zambia', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBlue.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check, size: 13, color: AppColors.primaryBlue),
                                    const SizedBox(width: 4),
                                    Text('Verified', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryBlue)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Payment Status ────────────────────────────────────
                    if (orderType != OrderDetailType.cancelled)
                      _SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 36, height: 36,
                                  decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), shape: BoxShape.circle),
                                  child: const Icon(Icons.attach_money, color: AppColors.success, size: 20),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Payment Status', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                                    const SizedBox(height: 2),
                                    Text(
                                      orderType == OrderDetailType.active
                                          ? 'Funds secured in ChapBuy Escrow'
                                          : 'Payment released to your account',
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (orderType == OrderDetailType.active) ...[
                              const SizedBox(height: 12),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBlue.withOpacity(0.07),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Protected Transaction',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primaryBlue)),
                                    const SizedBox(height: 4),
                                    Text('Funds will be released after successful delivery and buyer confirmation',
                                        style: TextStyle(fontSize: 12, color: AppColors.primaryBlue.withOpacity(0.7), height: 1.4)),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                    // ── Order Cancel Banner ───────────────────────────────
                    if (orderType == OrderDetailType.cancelled)
                      _SectionCard(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 36, height: 36,
                              decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), shape: BoxShape.circle),
                              child: Icon(Icons.cancel_outlined, color: AppColors.error, size: 20),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Cancel', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.error)),
                                const SizedBox(height: 2),
                                Text('This order has been cancelled', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                              ],
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 12),

                    // ── Shipping Details ──────────────────────────────────
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Shipping Details', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                          const SizedBox(height: 14),
                          _ShippingRow(label: 'Incoterm', value: 'CIF'),
                          const SizedBox(height: 8),
                          _ShippingRow(label: 'Destination Port', value: 'Dar es Salaam', valueBold: true),
                          const SizedBox(height: 8),
                          _ShippingRow(label: 'Est. Ship Date', value: 'Jan 20, 2024', valueBold: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Order Timeline ────────────────────────────────────
                    if (orderType != OrderDetailType.cancelled)
                      _SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Order Timeline', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                            const SizedBox(height: 16),
                            _TimelineStep(
                              label: 'Placed',
                              date: 'Jan 5, 2024, 11:00 AM',
                              actor: 'Your Action',
                              actorColor: AppColors.success,
                              description: 'Order placed by buyer',
                              isCompleted: true,
                              isLast: false,
                            ),
                            _TimelineStep(
                              label: 'Processing',
                              date: 'Jan 6, 2024, 10:00 AM',
                              actor: 'Your Action',
                              actorColor: AppColors.success,
                              description: 'Preparing goods for inspection',
                              isCompleted: true,
                              isLast: false,
                            ),
                            _TimelineStep(
                              label: 'Ready For Verification',
                              date: 'Jan 8, 2024, 12:00 PM',
                              actor: 'Your Action',
                              actorColor: AppColors.success,
                              description: 'Goods ready for ChapBuy inspection',
                              isCompleted: true,
                              isLast: false,
                            ),
                            _TimelineStep(
                              label: 'Inspected',
                              date: 'Jan 9, 2024, 04:30 PM',
                              actor: 'ChapBuy Team',
                              actorColor: AppColors.primaryBlue,
                              description: 'Quality inspection completed. All standards met.',
                              isCompleted: orderType == OrderDetailType.completed,
                              isActive: orderType == OrderDetailType.active,
                              isLast: false,
                            ),
                            _TimelineStep(
                              label: 'Shipment In Progress',
                              date: 'Jan 5, 2024, 09:00 AM',
                              actor: 'Your Action',
                              actorColor: AppColors.success,
                              description: 'Goods in transit to port',
                              isCompleted: orderType == OrderDetailType.completed,
                              isLast: false,
                            ),
                            _TimelineStep(
                              label: 'Shipped',
                              date: 'Jan 10, 2024, 10:00 AM',
                              actor: 'ChapBuy Team',
                              actorColor: AppColors.primaryBlue,
                              description: 'Container loaded and shipped',
                              isCompleted: orderType == OrderDetailType.completed,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // ── Bottom Button ─────────────────────────────────────────────
            if (orderType == OrderDetailType.active || orderType == OrderDetailType.completed)
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                color: AppColors.background,
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Begin Shipment',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
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

// ── Timeline Step ─────────────────────────────────────────────────────────────
class _TimelineStep extends StatelessWidget {
  final String label;
  final String date;
  final String actor;
  final Color actorColor;
  final String description;
  final bool isCompleted;
  final bool isActive;
  final bool isLast;

  const _TimelineStep({
    required this.label,
    required this.date,
    required this.actor,
    required this.actorColor,
    required this.description,
    this.isCompleted = false,
    this.isActive = false,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final Color dotColor = isCompleted
        ? AppColors.success
        : isActive
            ? AppColors.warning
            : Colors.grey.shade300;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot + line
        Column(
          children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
              child: isCompleted
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : isActive
                      ? const Icon(Icons.more_horiz, size: 14, color: Colors.white)
                      : null,
            ),
            if (!isLast)
              Container(width: 2, height: 52,
                  color: isCompleted ? AppColors.success.withOpacity(0.3) : Colors.grey.shade200),
          ],
        ),
        const SizedBox(width: 12),

        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: isCompleted || isActive ? Colors.black87 : Colors.grey.shade400,
                        )),
                    Text(date, style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(actor, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: actorColor)),
                const SizedBox(height: 3),
                Text(description,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500, height: 1.4)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final Widget child;
  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: child,
    );
  }
}

class _ShippingRow extends StatelessWidget {
  final String label;
  final String value;
  final bool valueBold;
  const _ShippingRow({required this.label, required this.value, this.valueBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
        Text(value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: valueBold ? FontWeight.w700 : FontWeight.normal,
              color: Colors.black87,
            )),
      ],
    );
  }
}