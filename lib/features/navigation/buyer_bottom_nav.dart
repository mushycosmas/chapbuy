import 'package:flutter/material.dart';

// Shared screens
import 'package:chapbuy/features/home/screens/home_screen.dart';
import 'package:chapbuy/features/my_order/screens/my_orders_screen.dart';
import 'package:chapbuy/features/profile/screens/profile_screen.dart';

import 'package:chapbuy/core/constants/app_colors.dart';
import 'package:chapbuy/features/navigation/widgets/nav_item.dart';

class BuyerBottomNavScreen extends StatefulWidget {
  const BuyerBottomNavScreen({super.key});

  @override
  State<BuyerBottomNavScreen> createState() => _BuyerBottomNavScreenState();
}

class _BuyerBottomNavScreenState extends State<BuyerBottomNavScreen> {
  int _index = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MyOrdersScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(), // placeholder (Messages later)
  ];

  void _onTap(int i) {
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],

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
                  isActive: _index == 0,
                  onTap: () => _onTap(0),
                ),
                NavItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart,
                  label: "Orders",
                  isActive: _index == 1,
                  onTap: () => _onTap(1),
                ),
                NavItem(
                  icon: Icons.message_outlined,
                  activeIcon: Icons.message,
                  label: "Messages",
                  isActive: _index == 2,
                  onTap: () => _onTap(2),
                ),
                NavItem(
                  icon: Icons.request_page_outlined,
                  activeIcon: Icons.request_page,
                  label: "Request",
                  isActive: _index == 3,
                  onTap: () => _onTap(3),
                ),
                NavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: "Account",
                  isActive: _index == 4,
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