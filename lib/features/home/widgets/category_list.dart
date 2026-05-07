import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;

  const CategoryList({
    super.key,
    required this.categories,
  });

  // ✅ ICON LOGIC INSIDE THIS WIDGET
  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'maize':
        return Icons.grain;
      case 'rice':
        return Icons.rice_bowl;
      case 'wheat':
        return Icons.eco;
      case 'beans':
        return Icons.spa;
      case 'coffee':
        return Icons.coffee;

      // minerals
      case 'gold':
        return Icons.workspace_premium;
      case 'tanzanite':
        return Icons.diamond;
      case 'diamond':
        return Icons.diamond_outlined;

      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F3F3),
                ),
                child: Icon(
                  _getCategoryIcon(category),
                  color: AppColors.primaryGreen,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}