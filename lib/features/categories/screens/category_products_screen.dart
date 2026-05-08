import 'package:flutter/material.dart';
import 'package:chapbuy/features/categories/widgets/category_header.dart';
import 'package:chapbuy/features/categories/widgets/product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  final String categoryDescription;

  const CategoryProductsScreen({
    super.key,
    required this.categoryName,
    this.categoryDescription = "Cocoa, Coffee, Cashew and many more ...",
  });

  @override
  Widget build(BuildContext context) {
    final products = List.generate(10, (i) => {
          "name": i % 2 == 0 
              ? "Premium Organic Cocoa Beans" 
              : "Organic Coffee Beans",
          "rating": 4.6 + (i * 0.02),
          "reviews": 70 + i,
          "minOrder": "${i % 2 == 0 ? 5 : 10} ton",
          "price": 199.0,
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Category Header
          CategoryHeader(
            title: categoryName,
            description: categoryDescription,
          ),
          
          // PRODUCTS GRID (2 COLUMNS)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}