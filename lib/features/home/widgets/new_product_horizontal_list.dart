import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';

class NewProductHorizontalList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const NewProductHorizontalList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // 🔥 HEADER (FAST TRADED)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "New Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed: () {
                // TODO: Navigate to all fast traded products
              },
              child: const Text("View All"),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // 🔥 HORIZONTAL LIST
        SizedBox(
          height: 320,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final product = products[index];
              final imageUrl = product['image'];

              return Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 🖼 IMAGE + OFFER
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                          child: (imageUrl == null || imageUrl.toString().isEmpty)
                              ? Container(
                                  height: 130,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.image_not_supported),
                                )
                              : Image.network(
                                  imageUrl,
                                  height: 130,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    height: 130,
                                    color: Colors.grey.shade200,
                                    child: const Icon(Icons.broken_image),
                                  ),
                                ),
                        ),

                        // 🔥 OFFER BADGE
                        if (product['offer'] != null)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${product['offer']}% OFF",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // 📦 TITLE
                          Text(
                            product['name'] ?? "No Name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // ⭐ RATING + MIN ORDER
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 14),
                              const SizedBox(width: 4),
                              Text("${product['rating'] ?? 0}"),

                              const SizedBox(width: 10),

                              const Icon(Icons.shopping_bag,
                                  size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text("Min ${product['minOrder'] ?? 1}"),
                            ],
                          ),

                          const SizedBox(height: 6),

                          // 📍 LOCATION
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  product['location'] ?? "Unknown",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // 💰 PRICE
                          Text(
                           "\$${product['price'] ?? 0}",
                            style: TextStyle(
                              color: AppColors.primaryGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}