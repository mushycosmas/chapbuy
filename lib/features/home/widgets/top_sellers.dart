import 'package:flutter/material.dart';

class TopSellers extends StatelessWidget {
  final List<Map<String, dynamic>> sellers;

  const TopSellers({
    super.key,
    required this.sellers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Top Sellers",
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

        // LIST
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sellers.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final seller = sellers[index];

              final String imageUrl = seller['image'] ?? '';
              final String name = seller['name'] ?? 'Unknown Seller';
              final String location = seller['location'] ?? 'Tanzania';
              final int years = seller['years'] ?? 0;
              final double rating = (seller['rating'] ?? 0).toDouble();
              final int sales = seller['sales'] ?? 0;
              final int products = seller['products'] ?? 0;

              return Container(
                width: 170,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LOGO
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage:
                          imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                      child: imageUrl.isEmpty
                          ? const Icon(
                              Icons.business,
                              size: 28,
                              color: Colors.grey,
                            )
                          : null,
                    ),

                    const SizedBox(height: 8),

                    // NAME
                    Text(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // LOCATION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 10,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // TOP STATS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatBox(value: "$years", label: "Years"),
                        _StatBox(
                          value: rating.toStringAsFixed(1),
                          label: "Rating",
                          icon: Icons.star,
                          iconColor: const Color(0xFFFFB800),
                        ),
                        _StatBox(value: "$sales", label: "Sales"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // BOTTOM STATS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatBox(value: "$products", label: "Products"),
                        _StatBox(value: "$sales", label: "Orders"),
                        _StatBox(value: "$rating", label: "Score"),
                      ],
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

/// Reusable stat widget
class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final IconData? icon;
  final Color? iconColor;

  const _StatBox({
    required this.value,
    required this.label,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 10,
                color: iconColor ?? Colors.grey,
              ),
            if (icon != null) const SizedBox(width: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 8,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}