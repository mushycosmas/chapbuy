import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/stat_card.dart';
import '../widgets/section_header.dart';
import '../widgets/notification_item.dart';
import '../widgets/quick_action_card.dart';

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

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
              // Welcome Header
              const Text(
                'Nelson Doe,',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // Stats Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.55,
                children: [
                  StatCard(
                    title: 'Total Revenue (Paid)',
                    value: '\$450,000',
                    bgColor: AppColors.cardBgGreen,
                    valueColor: AppColors.success,
                  ),
                  StatCard(
                    title: 'Active Orders',
                    value: '17',
                    bgColor: AppColors.cardBgOrange,
                    valueColor: AppColors.warning,
                  ),
                  StatCard(
                    title: 'Pending RFQs',
                    value: '17',
                    bgColor: AppColors.cardBgPurple,
                    valueColor: AppColors.purple,
                  ),
                  StatCard(
                    title: 'My orders',
                    value: '5',
                    bgColor: AppColors.cardBgGreen,
                    valueColor: AppColors.teal,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Notifications Section
              const SectionHeader(
                title: 'Notifications',
                actionText: 'Mark all as read',
              ),
              const SizedBox(height: 12),

              const NotificationItem(
                title: 'New RFQ Received',
                subtitle: 'Continental Foods Ltd is requesting a quote for 100 MT White Maize',
                timeAgo: '2d ago',
              ),
              const Divider(),
              const NotificationItem(
                title: 'Order Inspection Complete',
                subtitle: 'ORD-2024-001 has been inspected and verified by ChapBuy',
                timeAgo: '2d ago',
              ),
              const Divider(),
              const NotificationItem(
                title: 'Quote Under Negotiation',
                subtitle: 'Middle East Foods Trading wants to negotiate your quote for Red Kidney b...',
                timeAgo: '2d ago',
              ),
              const SizedBox(height: 24),

              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.cloud_upload_outlined,
                      label: 'Upload Product',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.flash_on_outlined,
                      label: 'Create Fast Trade',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Pending RFQs
              const SectionHeader(
                title: 'Pending RFQs',
                actionText: 'View All',
              ),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'White Maize',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Chip(
                          label: Text('Available'),
                          backgroundColor: AppColors.cardBgGreen,
                          labelStyle: TextStyle(
                            color: AppColors.success,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Continental Foods Ltd',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '100 MT · CIF · \$280/MT',
                      style: TextStyle(fontWeight: FontWeight.w500),
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
}