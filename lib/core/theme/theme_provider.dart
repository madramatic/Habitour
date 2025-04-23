import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'theme_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeProvider implements ThemeConfigProvider {
  @override
  ThemeData lightTheme() {
    return _createThemeData(
      brightness: Brightness.light,
      seedColor: AppColors.primarySeedLight,
      secondarySeedColor: AppColors.secondarySeedLight,
      accentSeedColor: AppColors.accentSeedLight,
      backgroundColor: AppColors.bgLight,
      surfaceColor: AppColors.surfaceLight,
      errorColor: AppColors.errorLight,
    );
  }

  @override
  ThemeData darkTheme() {
    return _createThemeData(
      brightness: Brightness.dark,
      seedColor: AppColors.primarySeedDark,
      secondarySeedColor: AppColors.secondarySeedDark,
      accentSeedColor: AppColors.accentSeedDark,
      backgroundColor: AppColors.bgDark,
      surfaceColor: AppColors.surfaceDark,
      errorColor: AppColors.errorDark,
    );
  }

  ThemeData _createThemeData({
    required Brightness brightness,
    required Color seedColor,
    required Color secondarySeedColor,
    required Color accentSeedColor,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color errorColor,
  }) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      secondary: secondarySeedColor,
      tertiary: accentSeedColor,
      brightness: brightness,
      error: errorColor,
      surface: surfaceColor,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        titleTextStyle: TextStyle(
          color: colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentSeedColor,
        foregroundColor: isDark ? Colors.white : Colors.black87,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.primary.withOpacity(0.85),
        contentTextStyle: TextStyle(color: colorScheme.onPrimary),
      ),
      dividerTheme: DividerThemeData(
        color: isDark
            ? AppColors.surfaceDark.withOpacity(0.2)
            : AppColors.surfaceLight.withOpacity(0.2),
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.surfaceDark : AppColors.bgLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: isDark
                  ? AppColors.surfaceDark.withOpacity(0.2)
                  : AppColors.surfaceLight.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: isDark
                  ? AppColors.surfaceDark.withOpacity(0.2)
                  : AppColors.surfaceLight.withOpacity(0.2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorColor),
        ),
      ),
      textTheme: _buildTextTheme(
        ThemeData(brightness: brightness).textTheme,
        colorScheme.onSurface,
        colorScheme.onPrimary,
      ),
    );
  }

  TextTheme _buildTextTheme(TextTheme base, Color onSurface, Color onPrimary) {
    return GoogleFonts.rubikTextTheme(base).copyWith(
      displayLarge: base.displayLarge
          ?.copyWith(color: onSurface, fontWeight: FontWeight.bold),
      displayMedium: base.displayMedium
          ?.copyWith(color: onSurface, fontWeight: FontWeight.bold),
      displaySmall: base.displaySmall
          ?.copyWith(color: onSurface, fontWeight: FontWeight.w600),
      headlineMedium: base.headlineMedium
          ?.copyWith(color: onSurface, fontWeight: FontWeight.w600),
      headlineSmall: base.headlineSmall
          ?.copyWith(color: onSurface, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.rubikMonoOne(
        textStyle: base.titleLarge
        ?.copyWith(color: onSurface, fontWeight: FontWeight.bold),
      ),
      titleMedium: base.titleMedium
          ?.copyWith(color: onSurface, fontWeight: FontWeight.w600),
      titleSmall: base.titleSmall?.copyWith(color: onSurface),
      bodyLarge: base.bodyLarge?.copyWith(color: onSurface),
      bodyMedium: base.bodyMedium?.copyWith(color: onSurface),
      bodySmall: base.bodySmall?.copyWith(color: onSurface.withOpacity(0.8)),
      labelLarge: base.labelLarge?.copyWith(color: onPrimary),
    );
  }
}
