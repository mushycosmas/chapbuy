import 'package:flutter/material.dart';

class AppColors {
  // ── Primary ───────────────────────────────────────────────────────────────
  static const Color primaryGreen = Color(0xFF008000);
  static const Color primaryBlue  = Color(0xFF3498DB);

  // ── Status ────────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error   = Color(0xFFE74C3C);
  static const Color purple  = Color(0xFF8E44AD);
  static const Color teal    = Color(0xFF1ABC9C);

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static const Color background     = Color(0xFFF8F9FA);

  // Card tint backgrounds
  static const Color cardBgGreen    = Color(0xFFE8F8F5);
  static const Color cardBgOrange   = Color(0xFFFEF9E7);
  static const Color cardBgPurple   = Color(0xFFF4ECF7);
  static const Color cardBgBlue     = Color(0xFFEBF5FB);
  static const Color cardBgRed      = Color(0xFFFFEBEE);

  // Notification / info tint
  static const Color notificationBg = Color(0xFFE8F4FD);

  // ── Chat ──────────────────────────────────────────────────────────────────
  static const Color chatSentBubble     = Color(0xFF1B5E20);
  static const Color chatReceivedBubble = Color(0xFFFFFFFF);
  static const Color chatBackground     = Color(0xFFF5F5F5);

  // ── Badge helpers (text colors match status) ──────────────────────────────
  static const Color badgeAvailable = primaryBlue;
  static const Color badgeExpired   = error;
  static const Color badgePending   = warning;
  static const Color badgeActive    = success;
}