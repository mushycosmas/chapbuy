import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              height: 90,
              color: Colors.grey.shade100,
              child: const Center(
                child: Icon(
                  Icons.agriculture,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // INFO
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Product Name
                Text(
                  product["name"] ?? "Organic Cocoa Beans",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                // Rating row - FIXED: Using Flexible to prevent overflow
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 9,
                      color: Color(0xFFFFB800),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "${product["rating"] ?? 4.6}",
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Flexible(
                      child: Text(
                        "(${product["reviews"] ?? 70})",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey[500],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                // Min order - FIXED: Using Flexible
                Row(
                  children: [
                    const Icon(
                      Icons.production_quantity_limits,
                      size: 9,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 2),
                    Flexible(
                      child: Text(
                        "Min: ${product["minOrder"] ?? "5 ton"}",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Price and Buy button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$${product["price"] ?? 199}.00",
                            style: const TextStyle(
                              color: AppColors.primaryGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "/ton",
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Buy Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFE9A00), Color(0xFFF54900)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        "Buy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}