import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<_NotifItem> _items = [
    _NotifItem(
      type: _NotifType.rfq,
      title: 'New RFQ Received',
      description:
          'Continental Foods Ltd is requesting a quote for 100 MT White Maize',
      time: '2d ago',
      actionLabel: 'Submit Quote',
      isUnread: true,
    ),
    _NotifItem(
      type: _NotifType.inspection,
      title: 'Order Inspection Complete',
      description:
          'ORD-2024-001 has been inspected and verified by ChapBuy',
      time: '2d ago',
      actionLabel: 'Submit Quote',
      isUnread: true,
    ),
    _NotifItem(
      type: _NotifType.negotiation,
      title: 'Quote Under Negotiation',
      description:
          'Middle East Foods Trading wants to negotiate your quote for Red Kidney b...',
      time: '2d ago',
      actionLabel: 'Submit Quote',
      isUnread: false,
    ),
    _NotifItem(
      type: _NotifType.negotiation,
      title: 'Quote Under Negotiation',
      description:
          'Middle East Foods Trading wants to negotiate your quote for Red Kidney b...',
      time: '2d ago',
      actionLabel: 'Submit Quote',
      isUnread: false,
    ),
    _NotifItem(
      type: _NotifType.inspection,
      title: 'Order Inspection Complete',
      description:
          'ORD-2024-001 has been inspected and verified by ChapBuy',
      time: '2d ago',
      actionLabel: 'Submit Quote',
      isUnread: false,
    ),
    _NotifItem(
      type: _NotifType.payment,
      title: 'Payment in Escrow',
      description:
          'Payment for ORD-2024-003 (25 MT Soy beans) is secured in escrow ...',
      time: '2d ago',
      actionLabel: null,
      isUnread: false,
    ),
    _NotifItem(
      type: _NotifType.payment,
      title: 'Payment in Escrow',
      description:
          'Payment for ORD-2024-003 (25 MT Soy beans) is secured in escrow ...',
      time: '2d ago',
      actionLabel: null,
      isUnread: false,
    ),
    _NotifItem(
      type: _NotifType.rfq,
      title: 'New RFQ Received',
      description:
          'European Oil Mills is requesting a quote for 40 MT Sunflower Seeds',
      time: '2d ago',
      actionLabel: 'Submit Quote',
      isUnread: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left,
                        size: 28, color: Colors.black87),
                  ),
                  const Expanded(
                    child: Text(
                      'Notifications',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      for (final n in _items) {
                        n.isUnread = false;
                      }
                    }),
                    child: const Text(
                      'Mark all as read',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── List ─────────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _NotifCard(
                      item: item,
                      onTap: () => setState(() => item.isUnread = false),
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

// ── Notification Card ─────────────────────────────────────────────────────────
class _NotifCard extends StatelessWidget {
  final _NotifItem item;
  final VoidCallback onTap;

  const _NotifCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: item.cardBgColor,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Rounded square icon ──
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: item.iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, size: 22, color: item.iconColor),
            ),
            const SizedBox(width: 12),

            // ── Content ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + red unread dot
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      if (item.isUnread) ...[
                        const SizedBox(width: 6),
                        Container(
                          width: 9,
                          height: 9,
                          margin: const EdgeInsets.only(top: 3),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),

                  // Time
                  Text(
                    item.time,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Description
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                  ),

                  // Action link
                  if (item.actionLabel != null) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.actionLabel!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: AppColors.primaryBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────
enum _NotifType { rfq, inspection, negotiation, payment }

class _NotifItem {
  final _NotifType type;
  final String title;
  final String description;
  final String time;
  final String? actionLabel;
  bool isUnread;

  _NotifItem({
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    required this.actionLabel,
    required this.isUnread,
  });

  Color get cardBgColor {
    switch (type) {
      case _NotifType.rfq:
        return AppColors.cardBgOrange.withOpacity(0.5); // very light orange
      case _NotifType.inspection:
        return AppColors.cardBgBlue; // very light blue
      case _NotifType.negotiation:
        return AppColors.cardBgPurple; // very light purple
      case _NotifType.payment:
        return AppColors.cardBgGreen; // very light green
    }
  }

  Color get iconBgColor {
    switch (type) {
      case _NotifType.rfq:
        return const Color(0xFFFFE0B2); // orange
      case _NotifType.inspection:
        return const Color(0xFFBBDEFB); // blue
      case _NotifType.negotiation:
        return const Color(0xFFE1BEE7); // purple
      case _NotifType.payment:
        return const Color(0xFFC8E6C9); // green
    }
  }

  Color get iconColor {
    switch (type) {
      case _NotifType.rfq:
        return AppColors.warning;
      case _NotifType.inspection:
        return AppColors.primaryBlue;
      case _NotifType.negotiation:
        return AppColors.purple;
      case _NotifType.payment:
        return AppColors.success;
    }
  }

  IconData get icon {
    switch (type) {
      case _NotifType.rfq:
        return Icons.description_outlined;
      case _NotifType.inspection:
        return Icons.fact_check_outlined;
      case _NotifType.negotiation:
        return Icons.notifications_outlined;
      case _NotifType.payment:
        return Icons.account_balance_wallet_outlined;
    }
  }
}