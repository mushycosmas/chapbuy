import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';
import 'package:chapbuy/features/products/widgets/product_image.dart';
import 'package:chapbuy/features/products/widgets/product_header.dart';
import 'package:chapbuy/features/products/widgets/product_facts.dart';
import 'package:chapbuy/features/products/widgets/supplier_section.dart';
import 'package:chapbuy/features/products/widgets/escrow_info.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Product Detail",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ProductHeader(product: product),
                  const SizedBox(height: 20),

                  ProductFacts(product: product),
                  const SizedBox(height: 20),

                  SupplierSection(product: product),
                  const SizedBox(height: 20),

                  const EscrowInfo(),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Buy Now",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}