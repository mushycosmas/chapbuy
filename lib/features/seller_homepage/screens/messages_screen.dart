import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _filterSelected = 'All';
  bool _showFilterDropdown = false;

  final List<_Conversation> _conversations = [
    _Conversation(
      name: 'Accra Agro Exports',
      preview: 'We have successfully shipped the 50,000 ...',
      time: '2 min ago',
      unreadCount: 2,
      isVerified: true,
      isOnline: true,
      avatarColor: const Color(0xFF4CAF50),
      initials: 'AA',
    ),
    _Conversation(
      name: 'Abidjan Commodities',
      preview: 'We have successfully shipped the 50,000 ...',
      time: '2 min ago',
      unreadCount: 1,
      isVerified: false,
      isOnline: false,
      avatarColor: const Color(0xFF2196F3),
      initials: 'AC',
    ),
    _Conversation(
      name: 'Lagos Minerals Ltd',
      preview: 'We have successfully shipped the 50,000 ...',
      time: '10:23',
      unreadCount: 3,
      isVerified: true,
      isOnline: false,
      avatarColor: const Color(0xFF9C27B0),
      initials: 'LM',
    ),
    _Conversation(
      name: 'Accra Agro Exports',
      preview: 'The new harvest of AA is ready for picki...',
      time: 'Yesterday',
      unreadCount: 0,
      isVerified: true,
      isOnline: false,
      avatarColor: const Color(0xFF4CAF50),
      initials: 'AA',
      isRead: true,
    ),
    _Conversation(
      name: 'Kenya Enterprise',
      preview: 'We have successfully shipped the 50,000 ...',
      time: 'Tuesday',
      unreadCount: 0,
      isVerified: false,
      isOnline: false,
      avatarColor: const Color(0xFFFF5722),
      initials: 'KE',
      isRead: true,
      isSent: true,
    ),
    _Conversation(
      name: 'Accra Agro Exports',
      preview: 'Thank you for your inquiry about the Gree ...',
      time: 'Monday',
      unreadCount: 0,
      isVerified: true,
      isOnline: false,
      avatarColor: const Color(0xFF4CAF50),
      initials: 'AA',
      isRead: false,
      isSent: true,
    ),
    _Conversation(
      name: 'Tanzanian Gem Traders',
      preview: 'We have successfully shipped the 50,000 ...',
      time: 'Oct 23',
      unreadCount: 0,
      isVerified: true,
      isOnline: false,
      avatarColor: const Color(0xFF795548),
      initials: 'TG',
      isRead: true,
      isSent: true,
      isDelivered: true,
    ),
  ];

  List<_Conversation> get _filtered {
    final list = _conversations.where((c) {
      if (_searchController.text.isNotEmpty) {
        return c.name.toLowerCase().contains(_searchController.text.toLowerCase());
      }
      return true;
    }).toList();

    if (_filterSelected == 'Read') return list.where((c) => c.isRead).toList();
    if (_filterSelected == 'Unread') return list.where((c) => !c.isRead && c.unreadCount > 0).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: Icon(
                      Icons.chevron_left,
                      size: 28,
                      color: Navigator.canPop(context) ? Colors.black87 : Colors.transparent,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Search + Filter ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Search suppliers or messages ...',
                          hintStyle: TextStyle(
                              fontSize: 13, color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.search,
                              color: Colors.grey.shade400, size: 20),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Filter button
                  GestureDetector(
                    onTap: () =>
                        setState(() => _showFilterDropdown = !_showFilterDropdown),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Icon(Icons.tune,
                          color: Colors.grey.shade600, size: 20),
                    ),
                  ),
                ],
              ),
            ),

            // ── Filter Dropdown ───────────────────────────────────────────
            if (_showFilterDropdown)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 16, top: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: ['All', 'Read', 'Unread'].map((option) {
                      final isSelected = _filterSelected == option;
                      return GestureDetector(
                        onTap: () => setState(() {
                          _filterSelected = option;
                          _showFilterDropdown = false;
                        }),
                        child: Container(
                          width: 120,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.success.withOpacity(0.08)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isSelected
                                  ? AppColors.success
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

            const SizedBox(height: 8),

            // ── Conversation List ─────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                itemCount: _filtered.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  indent: 76,
                  color: Colors.grey.shade100,
                ),
                itemBuilder: (context, index) {
                  final conv = _filtered[index];
                  return _ConversationTile(
                    conversation: conv,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            name: conv.name,
                            isVerified: conv.isVerified,
                            location: 'Ashanti, Ghana',
                            avatarColor: conv.avatarColor,
                            initials: conv.initials,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Conversation Tile ─────────────────────────────────────────────────────────
class _ConversationTile extends StatelessWidget {
  final _Conversation conversation;
  final VoidCallback onTap;

  const _ConversationTile({required this.conversation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = conversation;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: c.avatarColor.withOpacity(0.15),
                  child: Text(
                    c.initials,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: c.avatarColor,
                    ),
                  ),
                ),
                if (c.isOnline)
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: Container(
                      width: 11,
                      height: 11,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        c.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      if (c.isVerified) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.verified,
                            size: 15, color: AppColors.primaryBlue),
                      ],
                      const Spacer(),
                      Text(
                        c.time,
                        style: TextStyle(
                          fontSize: 11,
                          color: c.unreadCount > 0
                              ? AppColors.success
                              : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (c.isSent)
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            c.isDelivered
                                ? Icons.done_all
                                : Icons.done,
                            size: 14,
                            color: c.isDelivered
                                ? AppColors.success
                                : Colors.grey.shade400,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          c.preview,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      if (c.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.success,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${c.unreadCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────
class _Conversation {
  final String name;
  final String preview;
  final String time;
  final int unreadCount;
  final bool isVerified;
  final bool isOnline;
  final Color avatarColor;
  final String initials;
  final bool isRead;
  final bool isSent;
  final bool isDelivered;

  const _Conversation({
    required this.name,
    required this.preview,
    required this.time,
    required this.unreadCount,
    required this.isVerified,
    required this.isOnline,
    required this.avatarColor,
    required this.initials,
    this.isRead = false,
    this.isSent = false,
    this.isDelivered = false,
  });
}