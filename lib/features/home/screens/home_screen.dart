import 'package:flutter/material.dart';
import 'package:chapbuy/features/home/widgets/home_header.dart';
import 'package:chapbuy/features/home/widgets/home_search.dart';
import 'package:chapbuy/features/home/widgets/promo_slider.dart';
import 'package:chapbuy/features/home/widgets/category_list.dart';
import 'package:chapbuy/features/home/widgets/product_horizontal_list.dart';
import 'package:chapbuy/features/home/widgets/new_product_horizontal_list.dart';
import 'package:chapbuy/features/home/widgets/request_banner.dart';
import 'package:chapbuy/features/home/widgets/top_sellers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // ✅ CATEGORIES
    final categories = [
      'Maize',
      'Rice',
      'Gold',
      'Tanzanite',
      'Beans',
      'Coffee',
    ];

    // ✅ PRODUCTS
    final products = [
      {
        "image": "https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2",
        "name": "Maize - Premium Grade",
        "price": 1200,
        "rating": 4.5,
        "minOrder": 50,
        "location": "Dodoma, Tanzania",
        "offer": 10,
      },
      {
        "image": "https://images.unsplash.com/photo-1586201375761-83865001e31c",
        "name": "Rice - Super Quality",
        "price": 1500,
        "rating": 4.6,
        "minOrder": 30,
        "location": "Morogoro",
        "offer": 8,
      },
      {
        "image": "https://images.unsplash.com/photo-1589927986089-35812388d1f4",
        "name": "Beans - Organic",
        "price": 1800,
        "rating": 4.4,
        "minOrder": 20,
        "location": "Mbeya",
        "offer": 12,
      },
      {
        "image": "https://images.unsplash.com/photo-1625246333195-78d9c38ad449",
        "name": "Coffee Beans Export",
        "price": 5000,
        "rating": 4.8,
        "minOrder": 10,
        "location": "Kilimanjaro",
        "offer": 15,
      },
      {
        "image": "https://images.unsplash.com/photo-1607278967323-8769c4c9d6a3",
        "name": "Tea Leaves Fresh",
        "price": 3200,
        "rating": 4.3,
        "minOrder": 25,
        "location": "Iringa",
        "offer": 7,
      },
      {
        "image": "https://images.unsplash.com/photo-1615484477778-ca3b77940c25",
        "name": "Cassava Fresh",
        "price": 900,
        "rating": 4.2,
        "minOrder": 60,
        "location": "Tabora",
        "offer": 5,
      },
      {
        "image": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d",
        "name": "Gold Dust Pure",
        "price": 4500000,
        "rating": 4.9,
        "minOrder": 1,
        "location": "Geita",
        "offer": 3,
      },
      {
        "image": "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6",
        "name": "Tanzanite Gemstone",
        "price": 8000000,
        "rating": 5.0,
        "minOrder": 1,
        "location": "Arusha",
        "offer": 5,
      },
      {
        "image": "https://images.unsplash.com/photo-1616627982645-4c3f7b0d8d6d",
        "name": "Copper Ore",
        "price": 300000,
        "rating": 4.3,
        "minOrder": 5,
        "location": "Kahama",
        "offer": 6,
      },
      {
        "image": "https://images.unsplash.com/photo-1600431521340-491eca880813",
        "name": "Fertilizer NPK",
        "price": 70000,
        "rating": 4.6,
        "minOrder": 10,
        "location": "Dar es Salaam",
        "offer": 10,
      },
    ];

    // ✅ TOP SELLERS
    final sellers = [
      {
        "image": "https://picsum.photos/200",
        "name": "Chap Mobile Store",
        "location": "Dar es Salaam, Tanzania",
        "years": 5,
        "rating": 4.8,
        "sales": 12000,
        "products": 350,
      },
      {
        "image": "https://picsum.photos/201",
        "name": "Digital Hub",
        "location": "Arusha, Tanzania",
        "years": 3,
        "rating": 4.6,
        "sales": 8000,
        "products": 200,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const HomeHeader(),
              const SizedBox(height: 20),

              const HomeSearch(),
              const SizedBox(height: 24),

              const Text(
                'Today Deals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 14),

              const PromoSlider(),
              const SizedBox(height: 24),

              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 14),

              CategoryList(categories: categories),

              const SizedBox(height: 26),

              // 🔥 PRODUCT LIST 1
              ProductHorizontalList(products: products),

              const SizedBox(height: 26),

              // 🔥 PRODUCT LIST 2 (FAST TRADED NEW STYLE)
              NewProductHorizontalList(products: products),

              const SizedBox(height: 26),

              const RequestBanner(),

              const SizedBox(height: 26),

              // 🔥 TOP SELLERS
              TopSellers(sellers: sellers),
            ],
          ),
        ),
      ),
    );
  }
}