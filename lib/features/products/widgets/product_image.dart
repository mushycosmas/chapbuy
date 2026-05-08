import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: const Center(
        child: Icon(
          Icons.agriculture,
          size: 80,
          color: Colors.grey,
        ),
      ),
    );
  }
}