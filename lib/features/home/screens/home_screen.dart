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

    // ================================
    // ✅ CATEGORIES
    // ================================
    final categories = [
      'Maize',
      'Rice',
      'Gold',
      'Tanzanite',
      'Beans',
      'Coffee',
    ];

    // ================================
    // ✅ PRODUCTS (FULL STRUCTURE FIXED)
    // ================================
    final products = [
      {
        "id": 1,
        "image":
            "https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2",
        "name": "Maize - Premium Grade",
        "price": 1200,
        "rating": 4.5,
        "reviews": 120,
        "minOrder": 50,
        "location": "Dodoma, Tanzania",
        "discount": 10,
        "supplier": {
          "id": 1,
          "name": "Dodoma Farmers Co-op",
          "image": "https://picsum.photos/200",
          "location": "Dodoma",
          "rating": 4.7,
          "years": 6,
          "sales": 15000,
          "verified": true,
        }
      },
      {
        "id": 2,
        "image":
            "https://images.unsplash.com/photo-1586201375761-83865001e31c",
        "name": "Rice - Super Quality",
        "price": 1500,
        "rating": 4.6,
        "reviews": 98,
        "minOrder": 30,
        "location": "Morogoro, Tanzania",
        "discount": 8,
        "supplier": {
          "id": 2,
          "name": "Morogoro Agro Hub",
          "image": "https://picsum.photos/201",
          "location": "Morogoro",
          "rating": 4.6,
          "years": 4,
          "sales": 9000,
          "verified": true,
        }
      },
      {
        "id": 3,
        "image":
            "https://images.unsplash.com/photo-1589927986089-35812388d1f4",
        "name": "Beans - Organic",
        "price": 1800,
        "rating": 4.4,
        "reviews": 75,
        "minOrder": 20,
        "location": "Mbeya, Tanzania",
        "discount": 12,
        "supplier": {
          "id": 3,
          "name": "Mbeya Organic Farm",
          "image": "https://picsum.photos/202",
          "location": "Mbeya",
          "rating": 4.5,
          "years": 3,
          "sales": 7000,
          "verified": false,
        }
      },
      {
        "id": 4,
        "image":
            "https://images.unsplash.com/photo-1625246333195-78d9c38ad449",
        "name": "Coffee Beans Export",
        "price": 5000,
        "rating": 4.8,
        "reviews": 200,
        "minOrder": 10,
        "location": "Kilimanjaro, Tanzania",
        "discount": 15,
        "supplier": {
          "id": 4,
          "name": "Kilimanjaro Coffee Ltd",
          "image": "https://picsum.photos/203",
          "location": "Kilimanjaro",
          "rating": 4.9,
          "years": 10,
          "sales": 25000,
          "verified": true,
        }
      },
      {
        "id": 5,
        "image":
            "https://images.unsplash.com/photo-1607278967323-8769c4c9d6a3",
        "name": "Tea Leaves Fresh",
        "price": 3200,
        "rating": 4.3,
        "reviews": 65,
        "minOrder": 25,
        "location": "Iringa, Tanzania",
        "discount": 7,
        "supplier": {
          "id": 5,
          "name": "Iringa Tea Estate",
          "image": "https://picsum.photos/204",
          "location": "Iringa",
          "rating": 4.4,
          "years": 8,
          "sales": 11000,
          "verified": true,
        }
      },
      {
        "id": 6,
        "image":
            "https://images.unsplash.com/photo-1615484477778-ca3b77940c25",
        "name": "Cassava Fresh",
        "price": 900,
        "rating": 4.2,
        "reviews": 40,
        "minOrder": 60,
        "location": "Tabora, Tanzania",
        "discount": 5,
        "supplier": {
          "id": 6,
          "name": "Tabora Agro Farmers",
          "image": "https://picsum.photos/205",
          "location": "Tabora",
          "rating": 4.1,
          "years": 2,
          "sales": 5000,
          "verified": false,
        }
      },
      {
        "id": 7,
        "image":
            "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d",
        "name": "Gold Dust Pure",
        "price": 4500000,
        "rating": 4.9,
        "reviews": 300,
        "minOrder": 1,
        "location": "Geita, Tanzania",
        "discount": 3,
        "supplier": {
          "id": 7,
          "name": "Geita Mining Corp",
          "image": "https://picsum.photos/206",
          "location": "Geita",
          "rating": 4.8,
          "years": 12,
          "sales": 50000,
          "verified": true,
        }
      },
      {
        "id": 8,
        "image":
            "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6",
        "name": "Tanzanite Gemstone",
        "price": 8000000,
        "rating": 5.0,
        "reviews": 500,
        "minOrder": 1,
        "location": "Arusha, Tanzania",
        "discount": 5,
        "supplier": {
          "id": 8,
          "name": "Arusha Gems Ltd",
          "image": "https://picsum.photos/207",
          "location": "Arusha",
          "rating": 5.0,
          "years": 15,
          "sales": 80000,
          "verified": true,
        }
      },
      {
        "id": 9,
        "image":
            "https://images.unsplash.com/photo-1616627982645-4c3f7b0d8d6d",
        "name": "Copper Ore",
        "price": 300000,
        "rating": 4.3,
        "reviews": 90,
        "minOrder": 5,
        "location": "Kahama, Tanzania",
        "discount": 6,
        "supplier": {
          "id": 9,
          "name": "Kahama Mining Group",
          "image": "https://picsum.photos/208",
          "location": "Kahama",
          "rating": 4.2,
          "years": 7,
          "sales": 20000,
          "verified": false,
        }
      },
      {
        "id": 10,
        "image":
            "https://images.unsplash.com/photo-1600431521340-491eca880813",
        "name": "Fertilizer NPK",
        "price": 70000,
        "rating": 4.6,
        "reviews": 150,
        "minOrder": 10,
        "location": "Dar es Salaam, Tanzania",
        "discount": 10,
        "supplier": {
          "id": 10,
          "name": "Tanzania Agro Supply",
          "image": "https://picsum.photos/209",
          "location": "Dar es Salaam",
          "rating": 4.6,
          "years": 5,
          "sales": 30000,
          "verified": true,
        }
      },
    ];

    // ================================
    // ✅ TOP SELLERS
    // ================================
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

              ProductHorizontalList(products: products),

              const SizedBox(height: 26),

              NewProductHorizontalList(products: products),

              const SizedBox(height: 26),

              const RequestBanner(),

              const SizedBox(height: 26),

              TopSellers(sellers: sellers),
            ],
          ),
        ),
      ),
    );
  }
}