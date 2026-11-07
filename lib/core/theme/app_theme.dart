import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Hệ thống thiết kế dành riêng cho trẻ tự kỷ từ lớp 5 trở lên.
/// Ưu tiên: dự đoán được, giảm kích thích, tùy chỉnh cao, tôn trọng sự trưởng thành.
class AppTheme {
  // Màu chủ đạo - dịu, không gây quá tải
  static const Color primary = Color(0xFF5B8DEF);      // Xanh dương dịu
  static const Color primaryDark = Color(0xFF3A6BC7);
  static const Color secondary = Color(0xFF7BC67E);    // Xanh lá dịu
  static const Color accent = Color(0xFFFFB74D);       // Cam nhẹ (phần thưởng)

  static const Color background = Color(0xFFF7F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFEEF2F7);

  static const Color textPrimary = Color(0xFF1A2332);
  static const Color textSecondary = Color(0xFF5A6A7E);
  static const Color textHint = Color(0xFF9AABB8);

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFE57373);
  static const Color calm = Color(0xFF81D4FA);         // Màu không gian Tổ Ấm

  // Border radius lớn để dễ chạm
  static const double radiusSmall = 12;
  static const double radiusMedium = 16;
  static const double radiusLarge = 24;
  static const double radiusXLarge = 32;

  // Spacing nhất quán
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space48 = 48;

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.light(
        primary: primary,
        onPrimary: Colors.white,
        secondary: secondary,
        onSecondary: Colors.white,
        surface: surface,
        onSurface: textPrimary,
        error: error,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: background,
      textTheme: _buildTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          side: BorderSide(color: surfaceVariant, width: 1),
        ),
        margin: const EdgeInsets.symmetric(horizontal: space16, vertical: space8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          padding: const EdgeInsets.symmetric(horizontal: space24, vertical: space16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          minimumSize: const Size(double.infinity, 56),
          side: const BorderSide(color: primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: space16,
          vertical: space16,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: textHint,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      dividerTheme: const DividerThemeData(
        color: surfaceVariant,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get dark {
    // Dark theme vẫn giữ nguyên tắc dịu mắt
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.dark(
        primary: primary,
        onPrimary: Colors.white,
        secondary: secondary,
        surface: const Color(0xFF1E2430),
        onSurface: const Color(0xFFE8EEF5),
      ),
      scaffoldBackgroundColor: const Color(0xFF12161E),
      textTheme: _buildTextTheme(base.textTheme),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return GoogleFonts.nunitoTextTheme(base).copyWith(
      displayLarge: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        height: 1.3,
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      titleLarge: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      titleMedium: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        height: 1.5,
      ),
      labelLarge: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
    );
  }
}
