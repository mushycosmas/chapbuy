import 'package:flutter/material.dart';

import 'package:chapbuy/features/navigation/seller_bottom_nav.dart';
import 'package:chapbuy/features/navigation/buyer_bottom_nav.dart';

enum UserRole { buyer, seller }

class MainBottomNavScreen extends StatelessWidget {
  final UserRole role;

  const MainBottomNavScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return role == UserRole.seller
        ? const SellerBottomNavScreen()
        : const BuyerBottomNavScreen();
  }
}