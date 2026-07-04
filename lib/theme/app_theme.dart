import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Blinkit-inspired color palette & theme.
class AppColors {
  static const Color primaryYellow = Color(0xFFF8CB46);
  static const Color darkYellow = Color(0xFFF2A33C);
  static const Color primaryGreen = Color(0xFF0C831F);
  static const Color lightGreen = Color(0xFF0F9F2B);
  static const Color background = Color(0xFFF7F7F7);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1C1C1C);
  static const Color textGrey = Color(0xFF6B6B6B);
  static const Color discountRed = Color(0xFFE53935);
  static const Color borderGrey = Color(0xFFE5E5E5);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryYellow,
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryYellow,
        primary: AppColors.primaryYellow,
        secondary: AppColors.primaryGreen,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cardWhite,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.textDark),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
    );
  }
}
