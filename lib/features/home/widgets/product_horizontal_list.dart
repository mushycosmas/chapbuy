import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';
import 'package:chapbuy/features/products/screens/product_detail_screen.dart';

class ProductHorizontalList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductHorizontalList({
    super.key,
    required this.products,
  });

  void _openProduct(BuildContext context, Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 HEADER - Fast Traded is the section title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Fast Traded",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View All"),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // 🔥 HORIZONTAL LIST
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              final imageUrl = product['image'];

              return InkWell(
                onTap: () => _openProduct(context, product),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 157,
                  height: 207,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFCCCFD1).withOpacity(0.33),
                      width: 1,
                    ),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🖼 IMAGE + DISCOUNT BADGE
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: (imageUrl == null ||
                                    imageUrl.toString().isEmpty)
                                ? Container(
                                    height: 100,
                                    color: const Color(0xFFF5F5F5),
                                    child: const Center(
                                      child: Icon(
                                        Icons.agriculture,
                                        size: 40,
                                        color: Color(0xFFBDBDBD),
                                      ),
                                    ),
                                  )
                                : Image.network(
                                    imageUrl,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: 100,
                                      color: const Color(0xFFF5F5F5),
                                      child: const Center(
                                        child: Icon(
                                          Icons.agriculture,
                                          size: 40,
                                          color: Color(0xFFBDBDBD),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),

                          // Discount badge
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.trending_up,
                                    size: 9,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "15% off",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // 📦 CONTENT
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'] ??
                                    "Premium Organic Cocoa Beans",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                              ),

                              const SizedBox(height: 4),

                              // ⭐ RATING
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 9,
                                    color: Color(0xFFFFB800),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "${product['rating'] ?? 4.6}",
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "(${product['reviews'] ?? 78})",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.star_border,
                                    size: 8,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "Min. order: ${product['minOrder'] ?? 5} ton",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              // 📍 LOCATION
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 9,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    product['location'] ?? "Tanzania",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              // 💰 PRICE + DISCOUNT
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\$${product['price'] ?? 199}.00",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E7D32),
                                        ),
                                      ),
                                      Text(
                                        "/ton",
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red[50],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.redAccent,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Text(
                                      "${product['discount'] ?? 15}% off",
                                      style: TextStyle(
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8,
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
            },
          ),
        ),
      ],
    );
  }
}