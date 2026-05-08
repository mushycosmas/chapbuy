import 'package:flutter/material.dart';

import 'package:chapbuy/core/constants/app_colors.dart';

// Seller Home Features
import 'package:chapbuy/features/seller_homepage/screens/home_seller_screen.dart';
import 'package:chapbuy/features/seller_homepage/screens/rfp_screen.dart';

// Shared / Common Features
import 'package:chapbuy/features/profile/screens/profile_screen.dart';
import 'package:chapbuy/features/my_product/screens/my_product_screen.dart';
import 'package:chapbuy/features/my_order/screens/my_orders_screen.dart';

// 🔥 your reusable nav item
import 'package:chapbuy/features/navigation/widgets/nav_item.dart';

class SellerBottomNavScreen extends StatefulWidget {
  const SellerBottomNavScreen({super.key});

  @override
  State<SellerBottomNavScreen> createState() => _SellerBottomNavScreenState();
}

class _SellerBottomNavScreenState extends State<SellerBottomNavScreen> {
  int index = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = const [
      HomeSellerScreen(),
      MyProductScreen(),
      MyOrdersScreen(),
      RfpScreen(),
      ProfileScreen(),
    ];
  }

  void _onTap(int i) {
    setState(() => index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: "Home",
                  isActive: index == 0,
                  onTap: () => _onTap(0),
                ),
                NavItem(
                  icon: Icons.inventory_outlined,
                  activeIcon: Icons.inventory,
                  label: "Products",
                  isActive: index == 1,
                  onTap: () => _onTap(1),
                ),
                NavItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart,
                  label: "Orders",
                  isActive: index == 2,
                  onTap: () => _onTap(2),
                ),
                NavItem(
                  icon: Icons.request_page_outlined,
                  activeIcon: Icons.request_page,
                  label: "RFQ",
                  isActive: index == 3,
                  onTap: () => _onTap(3),
                ),
                NavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: "Account",
                  isActive: index == 4,
                  onTap: () => _onTap(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}