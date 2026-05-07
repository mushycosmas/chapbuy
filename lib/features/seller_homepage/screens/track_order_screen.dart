import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

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
                    child: const Icon(Icons.chevron_left,
                        size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text(
                      'Track Order',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  children: [
                    // ── Product Card ──────────────────────────────────────
                    Container(
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
                        children: [
                          Row(
                            children: [
                              // Product image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 64,
                                  height: 64,
                                  color: Colors.amber.shade100,
                                  child: Icon(Icons.spa,
                                      size: 32,
                                      color: Colors.amber.shade600),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Shea Butter',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Order #ORD-24749',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Divider(height: 1, color: Color(0xFFF0F0F0)),
                          const SizedBox(height: 16),
                          // Grid info
                          Row(
                            children: [
                              Expanded(
                                child: _GridInfo(
                                    label: 'Quantity', value: '20,000 kg'),
                              ),
                              Expanded(
                                child: _GridInfo(
                                  label: 'Target Price',
                                  value: '\$4.2/kg',
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Delivery',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade500)),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.warning.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'Processing',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.warning,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: _GridInfo(
                                  label: 'Total Amount',
                                  value: '\$1,589.00',
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  valueBold: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Order Status ──────────────────────────────────────
                    Container(
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
                          const Text(
                            'Order Status',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _TrackStep(
                            icon: Icons.check_circle,
                            label: 'Order Placed',
                            sublabel: 'Your order has been placed successfully.',
                            date: '19/05/2025, 06:22 AM',
                            status: _StepStatus.completed,
                            isLast: false,
                          ),
                          _TrackStep(
                            icon: Icons.inventory_2_outlined,
                            label: 'Processing',
                            sublabel:
                                'Vendor has confirmed and is packing your order.',
                            date: '19/05/2025, 06:22 AM',
                            status: _StepStatus.active,
                            isLast: false,
                          ),
                          _TrackStep(
                            icon: Icons.local_shipping_outlined,
                            label: 'In transit',
                            sublabel:
                                'Shipment is on it\'s way to the destination port.',
                            date: '19/05/2025, 06:22 AM',
                            status: _StepStatus.pending,
                            isLast: false,
                          ),
                          _TrackStep(
                            icon: Icons.location_on_outlined,
                            label: 'Delivered',
                            sublabel: 'Shipment successfully delivered.',
                            date: 'Est. 19/05/2025, 08:30 AM',
                            status: _StepStatus.pending,
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Est. Arrival + Carrier ────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
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
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today_outlined,
                                    size: 18, color: Colors.grey.shade500),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Est. Arrival',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade500)),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'June 25, 2025',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
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
                            child: Row(
                              children: [
                                Icon(Icons.directions_boat_outlined,
                                    size: 18, color: Colors.grey.shade500),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Carrier',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade500)),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'Maersk Logistics',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

// ── Track Step ────────────────────────────────────────────────────────────────
enum _StepStatus { completed, active, pending }

class _TrackStep extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final String date;
  final _StepStatus status;
  final bool isLast;

  const _TrackStep({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.date,
    required this.status,
    required this.isLast,
  });

  Color get _dotColor {
    switch (status) {
      case _StepStatus.completed: return AppColors.success;
      case _StepStatus.active: return AppColors.success;
      case _StepStatus.pending: return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon + line
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _dotColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 18, color: Colors.white),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 52,
                color: status == _StepStatus.pending
                    ? Colors.grey.shade200
                    : AppColors.success.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 14),

        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: status == _StepStatus.pending
                            ? Colors.grey.shade400
                            : Colors.black87,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  sublabel,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Grid Info ─────────────────────────────────────────────────────────────────
class _GridInfo extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  final bool valueBold;

  const _GridInfo({
    required this.label,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.valueBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: valueBold ? FontWeight.w700 : FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}