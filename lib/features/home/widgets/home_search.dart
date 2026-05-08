import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';
import 'package:chapbuy/features/search/search_result_screen.dart'; // ✅ FIXED PATH

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final TextEditingController _controller = TextEditingController();

  void _openSearch(String query) {
    final text = query.trim();

    if (text.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResultScreen(query: text),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // prevent memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.search,

            onSubmitted: _openSearch,

            decoration: InputDecoration(
              hintText: 'Search products...',

              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black54,
              ),

              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => _openSearch(_controller.text),
              ),

              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.tune,
            color: AppColors.primaryGreen,
          ),
        ),
      ],
    );
  }
}