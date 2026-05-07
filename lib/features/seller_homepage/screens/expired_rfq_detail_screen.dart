import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ExpiredRfqDetailScreen extends StatelessWidget {
  final String orderId;
  final String productName;
  final String category;
  final String quantity;
  final String targetPriceMin;
  final String targetPriceMax;
  final String description;
  final String buyerCompany;
  final String buyerName;
  final String buyerLocation;
  final String incoterm;
  final String deliveryLocation;
  final String requestCreated;
  final String expiredDate;

  const ExpiredRfqDetailScreen({
    super.key,
    this.orderId = 'ORD-2024-001',
    this.productName = 'White Maize',
    this.category = 'Agricultural',
    this.quantity = '100 MT',
    this.targetPriceMin = '\$50',
    this.targetPriceMax = '\$70',
    this.description = 'Looking for premium white maize for food processing.',
    this.buyerCompany = 'Continental Foods Ltd',
    this.buyerName = 'James Banda',
    this.buyerLocation = 'Lusaka, Zambia',
    this.incoterm = 'CIF',
    this.deliveryLocation = 'Durban, South Africa',
    this.requestCreated = 'Jan 9, 2024',
    this.expiredDate = 'January 16, 2024 at 12:59 AM',
  });

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
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left,
                        size: 28, color: Colors.black87),
                  ),
                  Expanded(
                    child: Text(
                      orderId,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEBEE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Expired',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE57373),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Expired Banner ────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3F3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red.shade100),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.cancel_outlined,
                              size: 18, color: Colors.red.shade400),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'This RFQ has expired',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red.shade500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Expired on: $expiredDate',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Product Card (greyed out) ──────────────────────────
                    Opacity(
                      opacity: 0.7,
                      child: _SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _InfoColumn(
                                    label: 'Category', value: category),
                                const SizedBox(width: 32),
                                _InfoColumn(
                                    label: 'Quantity Needed',
                                    value: quantity),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Buyer's Target Price",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '$targetPriceMin – $targetPriceMax',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' per MT',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text('Description',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500)),
                            const SizedBox(height: 4),
                            Text(description,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    height: 1.4)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Buyer Information ─────────────────────────────────
                    Opacity(
                      opacity: 0.7,
                      child: _SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Buyer Information',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500)),
                            const SizedBox(height: 12),
                            Text(buyerCompany,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54)),
                            const SizedBox(height: 2),
                            Text(buyerName,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade500)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    size: 14, color: Colors.grey.shade400),
                                const SizedBox(width: 4),
                                Text(buyerLocation,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade400)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Delivery Terms ────────────────────────────────────
                    Opacity(
                      opacity: 0.7,
                      child: _SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Delivery Terms',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54)),
                            const SizedBox(height: 14),
                            _DeliveryRow(
                                label: 'Incoterm', value: incoterm),
                            const SizedBox(height: 10),
                            _DeliveryRow(
                                label: 'Delivery Location',
                                value: deliveryLocation,
                                valueBold: true),
                            const SizedBox(height: 10),
                            _DeliveryRow(
                                label: 'Request Created',
                                value: requestCreated,
                                valueBold: true),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── No action available notice ────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_outline,
                              size: 16, color: Colors.grey.shade400),
                          const SizedBox(width: 8),
                          Text(
                            'This RFQ is closed — no actions available',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  const _InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
        const SizedBox(height: 3),
        Text(value,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black54)),
      ],
    );
  }
}

class _DeliveryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool valueBold;
  const _DeliveryRow(
      {required this.label, required this.value, this.valueBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
        Text(value,
            style: TextStyle(
                fontSize: 13,
                fontWeight: valueBold ? FontWeight.w700 : FontWeight.normal,
                color: Colors.black54)),
      ],
    );
  }
}