import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'track_order_screen.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final bool isVerified;
  final String location;
  final Color avatarColor;
  final String initials;

  const ChatScreen({
    super.key,
    required this.name,
    required this.isVerified,
    required this.location,
    required this.avatarColor,
    required this.initials,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: 'You started a conversation with Accra Agro Exports.',
      isSystem: true,
      time: '',
    ),
    _ChatMessage(
      text: 'Hello! Thank you for your interest in our Premium Robusta Coffee Beans. We can provide Grade AA quality with all certifications. Would you like to discuss quantities?',
      isSent: false,
      time: '05:31 AM',
    ),
    _ChatMessage(
      text: "Yes, I'm interested in 20,000 kg. Can you provide samples first?",
      isSent: true,
      time: '05:31 AM',
    ),
    _ChatMessage(
      text: 'Absolutely! We can send 5kg samples via DHL. The samples will be free, you only cover shipping costs (approximately \$45). Would you like us to proceed?',
      isSent: false,
      time: '05:31 AM',
    ),
    _ChatMessage(
      isSent: false,
      isImage: true,
      imageCaption: 'This is what the item looks like, let me know so we can proceed with the order sir.',
      time: '05:31 AM',
    ),
    _ChatMessage(
      text: "That's a competitive price. Do you have Fair Trade certification?",
      isSent: true,
      time: '05:31 AM',
    ),
    _ChatMessage(
      isSent: false,
      isFile: true,
      fileName: 'Fair trade certi...',
      fileSize: '523 KB · pdf',
      time: '05:31 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () { if (Navigator.canPop(context)) Navigator.pop(context); },
                    child: const Icon(Icons.chevron_left,
                        size: 28, color: Colors.black87),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        widget.avatarColor.withOpacity(0.15),
                    child: Text(
                      widget.initials,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: widget.avatarColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            if (widget.isVerified) ...[
                              const SizedBox(width: 4),
                              Icon(Icons.verified,
                                  size: 14,
                                  color: AppColors.primaryBlue),
                            ],
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Verified Supplier',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              ' · ${widget.location}',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.black87),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // ── Order Ref Banner ──────────────────────────────────────────
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.local_shipping_outlined,
                      size: 16, color: AppColors.success),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Ref: Premium Robusta Coffee Be ...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TrackOrderScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'View Order',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.success,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Messages ──────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];

                  if (msg.isSystem) {
                    return _SystemMessage(text: msg.text ?? '');
                  }

                  if (msg.isImage) {
                    return _ImageBubble(
                      isSent: msg.isSent,
                      caption: msg.imageCaption ?? '',
                      time: msg.time,
                      avatarColor: widget.avatarColor,
                      initials: widget.initials,
                    );
                  }

                  if (msg.isFile) {
                    return _FileBubble(
                      isSent: msg.isSent,
                      fileName: msg.fileName ?? '',
                      fileSize: msg.fileSize ?? '',
                      time: msg.time,
                      avatarColor: widget.avatarColor,
                      initials: widget.initials,
                    );
                  }

                  return _TextBubble(
                    text: msg.text ?? '',
                    isSent: msg.isSent,
                    time: msg.time,
                    avatarColor: widget.avatarColor,
                    initials: widget.initials,
                  );
                },
              ),
            ),

            // ── Input Bar ─────────────────────────────────────────────────
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined,
                        color: Colors.grey.shade500),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.attach_file,
                        color: Colors.grey.shade500),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Type Message',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      if (_messageController.text.trim().isEmpty) return;
                      setState(() {
                        _messages.add(_ChatMessage(
                          text: _messageController.text.trim(),
                          isSent: true,
                          time: TimeOfDay.now().format(context),
                        ));
                        _messageController.clear();
                      });
                      Future.delayed(const Duration(milliseconds: 100), () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.send,
                          color: Colors.white, size: 18),
                    ),
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

// ── Message Widgets ───────────────────────────────────────────────────────────
class _SystemMessage extends StatelessWidget {
  final String text;
  const _SystemMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(
            'Today',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class _TextBubble extends StatelessWidget {
  final String text;
  final bool isSent;
  final String time;
  final Color avatarColor;
  final String initials;

  const _TextBubble({
    required this.text,
    required this.isSent,
    required this.time,
    required this.avatarColor,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSent) ...[
            CircleAvatar(
              radius: 14,
              backgroundColor: avatarColor.withOpacity(0.15),
              child: Text(initials,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: avatarColor)),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  decoration: BoxDecoration(
                    color: isSent
                        ? const Color(0xFF1B5E20)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isSent ? 16 : 4),
                      bottomRight: Radius.circular(isSent ? 4 : 16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 13,
                      color: isSent ? Colors.white : Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 10, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
          if (isSent) const SizedBox(width: 4),
        ],
      ),
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final bool isSent;
  final String caption;
  final String time;
  final Color avatarColor;
  final String initials;

  const _ImageBubble({
    required this.isSent,
    required this.caption,
    required this.time,
    required this.avatarColor,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSent) ...[
            CircleAvatar(
              radius: 14,
              backgroundColor: avatarColor.withOpacity(0.15),
              child: Text(initials,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: avatarColor)),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  decoration: BoxDecoration(
                    color: isSent ? const Color(0xFF1B5E20) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(14)),
                        child: Container(
                          height: 160,
                          color: Colors.brown.shade200,
                          child: Center(
                            child: Icon(Icons.image,
                                size: 48,
                                color: Colors.brown.shade400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          caption,
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                isSent ? Colors.white70 : Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Text(time,
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.shade400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FileBubble extends StatelessWidget {
  final bool isSent;
  final String fileName;
  final String fileSize;
  final String time;
  final Color avatarColor;
  final String initials;

  const _FileBubble({
    required this.isSent,
    required this.fileName,
    required this.fileSize,
    required this.time,
    required this.avatarColor,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSent) ...[
            CircleAvatar(
              radius: 14,
              backgroundColor: avatarColor.withOpacity(0.15),
              child: Text(initials,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: avatarColor)),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  decoration: BoxDecoration(
                    color: isSent ? const Color(0xFF1B5E20) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.picture_as_pdf,
                            color: Colors.red.shade400, size: 22),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isSent
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              fileSize,
                              style: TextStyle(
                                fontSize: 11,
                                color: isSent
                                    ? Colors.white60
                                    : Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.download_outlined,
                          size: 18,
                          color: isSent
                              ? Colors.white60
                              : Colors.grey.shade500),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Text(time,
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.shade400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────
class _ChatMessage {
  final String? text;
  final bool isSent;
  final bool isSystem;
  final bool isImage;
  final bool isFile;
  final String? imageCaption;
  final String? fileName;
  final String? fileSize;
  final String time;

  const _ChatMessage({
    this.text,
    this.isSent = false,
    this.isSystem = false,
    this.isImage = false,
    this.isFile = false,
    this.imageCaption,
    this.fileName,
    this.fileSize,
    required this.time,
  });
}