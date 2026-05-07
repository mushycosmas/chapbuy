import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class RfpScreen extends StatefulWidget {
  const RfpScreen({super.key});

  @override
  State<RfpScreen> createState() => _RfpScreenState();
}

class _RfpScreenState extends State<RfpScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'RFQs & Proposals',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryBlue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primaryBlue,
          tabs: const [
            Tab(text: 'Received'),
            Tab(text: 'Sent'),
            Tab(text: 'Negotiating'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ReceivedRfqsTab(),
          SentRfqsTab(),
          NegotiatingRfqsTab(),
        ],
      ),
    );
  }
}

class ReceivedRfqsTab extends StatelessWidget {
  const ReceivedRfqsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        RfpCard(
          productName: 'White Maize',
          buyerName: 'Continental Foods Ltd',
          quantity: '100 MT',
          terms: 'CIF',
          price: '\$280/MT',
          deadline: 'Mar 25, 2024',
          status: 'New',
          statusColor: AppColors.primaryBlue,
        ),
        SizedBox(height: 12),
        RfpCard(
          productName: 'Sunflower Seeds',
          buyerName: 'European Oil Mills',
          quantity: '40 MT',
          terms: 'FOB',
          price: '\$520/MT',
          deadline: 'Mar 28, 2024',
          status: 'Urgent',
          statusColor: Colors.red,
        ),
        SizedBox(height: 12),
        RfpCard(
          productName: 'Soybeans',
          buyerName: 'Asia Grain Trading',
          quantity: '75 MT',
          terms: 'CIF',
          price: '\$420/MT',
          deadline: 'Mar 30, 2024',
          status: 'New',
          statusColor: AppColors.primaryBlue,
        ),
      ],
    );
  }
}

class SentRfqsTab extends StatelessWidget {
  const SentRfqsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        RfpCard(
          productName: 'Red Kidney Beans',
          buyerName: 'Middle East Foods Trading',
          quantity: '50 MT',
          terms: 'CIF',
          price: '\$900/MT',
          deadline: 'Mar 20, 2024',
          status: 'Pending',
          statusColor: AppColors.warning,
          isSent: true,
        ),
        SizedBox(height: 12),
        RfpCard(
          productName: 'Yellow Corn',
          buyerName: 'African Food Imports',
          quantity: '120 MT',
          terms: 'FOB',
          price: '\$250/MT',
          deadline: 'Mar 22, 2024',
          status: 'Viewed',
          statusColor: AppColors.teal,
          isSent: true,
        ),
      ],
    );
  }
}

class NegotiatingRfqsTab extends StatelessWidget {
  const NegotiatingRfqsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        RfpCard(
          productName: 'Red Kidney Beans',
          buyerName: 'Middle East Foods Trading',
          quantity: '50 MT',
          terms: 'CIF',
          price: '\$850/MT',
          deadline: 'Mar 25, 2024',
          status: 'Negotiating',
          statusColor: AppColors.purple,
          isNegotiating: true,
        ),
        SizedBox(height: 12),
        RfpCard(
          productName: 'Lentils',
          buyerName: 'Indian Spice Trading',
          quantity: '30 MT',
          terms: 'CIF',
          price: '\$600/MT',
          deadline: 'Mar 27, 2024',
          status: 'Counter Offer',
          statusColor: AppColors.warning,
          isNegotiating: true,
          hasCounterOffer: true,
        ),
      ],
    );
  }
}

class RfpCard extends StatelessWidget {
  final String productName;
  final String buyerName;
  final String quantity;
  final String terms;
  final String price;
  final String deadline;
  final String status;
  final Color statusColor;
  final bool isSent;
  final bool isNegotiating;
  final bool hasCounterOffer;

  const RfpCard({
    super.key,
    required this.productName,
    required this.buyerName,
    required this.quantity,
    required this.terms,
    required this.price,
    required this.deadline,
    required this.status,
    required this.statusColor,
    this.isSent = false,
    this.isNegotiating = false,
    this.hasCounterOffer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                isSent ? Icons.send : Icons.sell,
                size: 14,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                buyerName,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _InfoColumn(label: 'Quantity', value: quantity),
              _InfoColumn(label: 'Terms', value: terms),
              _InfoColumn(label: 'Price', value: price),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Text(
                'Deadline: $deadline',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isNegotiating && hasCounterOffer)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.cardBgOrange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.swap_horiz, size: 20, color: AppColors.warning),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'New counter offer: \$820/MT',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.warning,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(isSent ? 'View Status' : 'View Details'),
                ),
              ),
              const SizedBox(width: 8),
              if (!isSent)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Submit Quote'),
                  ),
                ),
              if (isNegotiating)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warning,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Negotiate'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ],
    );
  }
}