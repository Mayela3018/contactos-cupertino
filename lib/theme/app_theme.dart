import 'package:flutter/cupertino.dart';

class AppTheme {
  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryDark = Color(0xFF5B21B6);
  static const Color primaryLight = Color(0xFFAB6FF7);
  static const Color cyan = Color(0xFF06B6D4);
  static const Color pink = Color(0xFFEC4899);
  static const Color accent = Color(0xFFF3E8FF);
  static const Color background = Color(0xFFF0F9FF);
  static const Color textPrimary = Color(0xFF1E1B4B);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color danger = Color(0xFFE53E3E);
  static const Color success = Color(0xFF06B6D4);

  static CupertinoThemeData get theme => const CupertinoThemeData(
        primaryColor: primary,
        barBackgroundColor: Color(0xFF7C3AED),
        scaffoldBackgroundColor: background,
        textTheme: CupertinoTextThemeData(
          primaryColor: primary,
          navTitleTextStyle: TextStyle(
            color: CupertinoColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          navActionTextStyle: TextStyle(
            color: CupertinoColors.white,
            fontSize: 16,
          ),
        ),
      );
}