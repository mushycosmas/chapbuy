import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'submit_quote_screen.dart';

class RfqDetailScreen extends StatelessWidget {
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
  final bool isVerified;
  final String incoterm;
  final String deliveryLocation;
  final String requestCreated;
  final bool isUrgent;
  final String? urgentMessage;

  const RfqDetailScreen({
    super.key,
    this.orderId = 'ORD-2024-001',
    this.productName = 'White Maize',
    this.category = 'Agricultural',
    this.quantity = '100 MT',
    this.targetPriceMin = '\$50',
    this.targetPriceMax = '\$70',
    this.description =
        'Looking for premium white maize for food processing.',
    this.buyerCompany = 'Global Grains Ltd',
    this.buyerName = 'James Banda',
    this.buyerLocation = 'Lusaka, Zambia',
    this.isVerified = true,
    this.incoterm = 'CIF',
    this.deliveryLocation = 'Durban, South Africa',
    this.requestCreated = 'Jan 9, 2024',
    this.isUrgent = true,
    this.urgentMessage = 'Deadline: January 16, 2024 at 12:59 AM',
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
                    // ── Urgent Banner ─────────────────────────────────────
                    if (isUrgent)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3F3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.red.shade100),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.error_outline,
                                size: 18, color: Colors.red.shade400),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Urgent: Quote deadline is Expired',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red.shade500,
                                    ),
                                  ),
                                  if (urgentMessage != null)
                                    Text(
                                      urgentMessage!,
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
                    if (isUrgent) const SizedBox(height: 16),

                    // ── Product Card ──────────────────────────────────────
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
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
                          // Target price box
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF4FF),
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
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryBlue,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' per MT',
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
                          const SizedBox(height: 14),
                          // Description
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 14),
                          // Specifications
                          Text(
                            'Specifications Required',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...[
                            'Moisture content: Max 13.5%',
                            'Protein content: Min 9%',
                            'Test weight: Min 76 kg/hl',
                            'Free from aflatoxin',
                          ].map((spec) => Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 6),
                                child: Row(
                                  children: [
                                    Icon(Icons.check_circle_outline,
                                        size: 16,
                                        color: AppColors.success),
                                    const SizedBox(width: 8),
                                    Text(
                                      spec,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Buyer Information ─────────────────────────────────
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buyer Information',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    buyerCompany,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    buyerName,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 14,
                                          color: Colors.grey.shade500),
                                      const SizedBox(width: 4),
                                      Text(
                                        buyerLocation,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (isVerified)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue
                                        .withOpacity(0.08),
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.check,
                                          size: 13,
                                          color: AppColors.primaryBlue),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Verified',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ── Delivery Terms ────────────────────────────────────
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Delivery Terms',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
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
                  ],
                ),
              ),
            ),

            // ── Submit Quote Button ───────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              color: AppColors.background,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubmitQuoteScreen(
                          orderId: orderId,
                          productName: productName,
                          buyerName: buyerCompany,
                          quantity: quantity,
                          targetPrice:
                              '$targetPriceMin – $targetPriceMax',
                          incoterm: incoterm,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit Quote',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
            style:
                TextStyle(fontSize: 11, color: Colors.grey.shade500)),
        const SizedBox(height: 3),
        Text(value,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black87)),
      ],
    );
  }
}

class _DeliveryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool valueBold;
  const _DeliveryRow(
      {required this.label,
      required this.value,
      this.valueBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                TextStyle(fontSize: 13, color: Colors.grey.shade500)),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight:
                valueBold ? FontWeight.w700 : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}