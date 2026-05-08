import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';

class ProductHeader extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductHeader({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product["name"] ?? "Organic Cocoa Beans",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          product["categories"] ?? "Agriculture • Commodities",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          product["pricePerKg"] ?? "\$2.8 / kg",
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product["totalPrice"] ?? "Total price: \$4,500",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          product["description"] ??
              "Premium export-grade agricultural commodity sourced from trusted suppliers.",
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}