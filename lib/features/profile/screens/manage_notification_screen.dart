import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ManageNotificationScreen extends StatefulWidget {
  const ManageNotificationScreen({super.key});

  @override
  State<ManageNotificationScreen> createState() =>
      _ManageNotificationScreenState();
}

class _ManageNotificationScreenState
    extends State<ManageNotificationScreen> {
  bool emailNotification = true;
  bool hotDeals = true;
  bool smsNotification = true;
  bool messages = true;
  bool feedback = true;
  bool chatbuy = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: SafeArea(
        child: Column(
          children: [
            // TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // TITLE
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Column(
                children: [
                  Text(
                    'Personalise Your Notification',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Manage your account and preference',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // LIST
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    _NotificationTile(
                      title: 'Email notification',
                      value: emailNotification,
                      onChanged: (v) {
                        setState(() {
                          emailNotification = v;
                        });
                      },
                    ),

                    _NotificationTile(
                      title: 'Hot deals & recommendations',
                      value: hotDeals,
                      onChanged: (v) {
                        setState(() {
                          hotDeals = v;
                        });
                      },
                    ),

                    _NotificationTile(
                      title: 'SMS Notification',
                      value: smsNotification,
                      onChanged: (v) {
                        setState(() {
                          smsNotification = v;
                        });
                      },
                    ),

                    _NotificationTile(
                      title: 'Messages',
                      value: messages,
                      onChanged: (v) {
                        setState(() {
                          messages = v;
                        });
                      },
                    ),

                    _NotificationTile(
                      title: 'Feedback',
                      value: feedback,
                      onChanged: (v) {
                        setState(() {
                          feedback = v;
                        });
                      },
                    ),

                    _NotificationTile(
                      title: 'ChapBuy web notifications',
                      value: chatbuy,
                      onChanged: (v) {
                        setState(() {
                          chatbuy = v;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────

class _NotificationTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.7,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12.5,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          Transform.scale(
            scale: 0.78,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF2DBE60),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade400,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}