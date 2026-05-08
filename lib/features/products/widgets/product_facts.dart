import 'package:flutter/material.dart';

class ProductFacts extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductFacts({
    super.key,
    required this.product,
  });

  // 🔥 SAFE CONVERTER (VERY IMPORTANT)
  String safe(dynamic value) {
    if (value == null) return "";
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _row("Price", "\$${safe(product['price'])}"),
          const SizedBox(height: 6),

          _row("Rating", safe(product['rating'])),
          const SizedBox(height: 6),

          _row("Reviews", safe(product['reviews'])),
          const SizedBox(height: 6),

          _row("Min Order", "${safe(product['minOrder'])} ton"),
          const SizedBox(height: 6),

          _row("Location", safe(product['location'])),
          const SizedBox(height: 6),

          _row("Discount", "${safe(product['discount'])}%"),

        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}