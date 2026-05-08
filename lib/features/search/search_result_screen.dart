import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({
    super.key,
    required this.query,
  });

  // 🌾 Sample agriculture + commodities data
  List<Map<String, dynamic>> get results => [
        {
          "name": "Maize (Grade A)",
          "price": "TZS 1,200 / kg",
          "location": "Dodoma",
          "type": "Grain",
        },
        {
          "name": "Cashew Nuts",
          "price": "TZS 3,800 / kg",
          "location": "Mtwara",
          "type": "Nut",
        },
        {
          "name": "Arabica Coffee",
          "price": "TZS 5,500 / kg",
          "location": "Kilimanjaro",
          "type": "Cash Crop",
        },
        {
          "name": "Rice (Super Quality)",
          "price": "TZS 2,100 / kg",
          "location": "Mbeya",
          "type": "Grain",
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results for \"$query\""),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: results.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),

        itemBuilder: (context, index) {
          final item = results[index];

          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
            ),

            child: Row(
              children: [
                // 🌿 ICON BLOCK (consistent with app theme)
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.agriculture,
                    color: AppColors.primaryGreen,
                  ),
                ),

                const SizedBox(width: 12),

                // DETAILS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAME
                      Text(
                        item["name"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // PRICE
                      Text(
                        item["price"],
                        style: const TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // LOCATION + TYPE
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.grey),

                          const SizedBox(width: 4),

                          Text(
                            item["location"],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item["type"],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ARROW
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}