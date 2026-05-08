import 'package:flutter/material.dart';
import 'package:chapbuy/core/constants/app_colors.dart';

class RequestBanner extends StatelessWidget {
  const RequestBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364,
      height: 111,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF1A443A),
            Color(0xFF41AA91),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              "Can't Find What You're Looking For?",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 4),
            // Subtitle
            const Text(
              "We're always adding new products request what you need.",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            // Button
            Container(
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Request a Product',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A443A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}