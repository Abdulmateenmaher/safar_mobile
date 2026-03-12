import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';

/// App Theme - Cyber-Luxury / Aero-Glass Design
class AppTheme {
  AppTheme._();

  // Theme Data - Dark Mode (Primary)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.neonBlue,
      scaffoldBackgroundColor: AppColors.obsidian,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.neonBlue,
        secondary: AppColors.neonPurple,
        tertiary: AppColors.neonEmerald,
        surface: AppColors.darkBlack,
        error: AppColors.neonRose,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.white,
        onError: AppColors.white,
      ),
      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.obsidian.withOpacity(0.8),
        foregroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
          size: AppDimens.iconMedium,
        ),
      ),
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.obsidian.withOpacity(0.95),
        selectedItemColor: AppColors.neonBlue,
        unselectedItemColor: AppColors.silver,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
        cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
        margin: EdgeInsets.zero,
      ),
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.charcoal,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing16,
          vertical: AppDimens.spacing16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.darkGray,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.neonBlue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.neonRose,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.neonRose,
            width: 2,
          ),
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.silver,
          fontSize: 14,
        ),
        labelStyle: GoogleFonts.inter(
          color: AppColors.silver,
          fontSize: 14,
        ),
        prefixIconColor: AppColors.silver,
        suffixIconColor: AppColors.silver,
      ),
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.neonBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing24,
            vertical: AppDimens.spacing16,
          ),
          minimumSize: const Size(double.infinity, AppDimens.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusXXLarge),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.white,
          side: const BorderSide(color: AppColors.darkGray, width: 1),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing24,
            vertical: AppDimens.spacing16,
          ),
          minimumSize: const Size(double.infinity, AppDimens.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusXXLarge),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.neonBlue,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: AppDimens.iconMedium,
      ),
      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.neonBlue,
        foregroundColor: AppColors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
      ),
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.charcoal,
        selectedColor: AppColors.neonBlue,
        disabledColor: AppColors.darkGray,
        labelStyle: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: 12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing12,
          vertical: AppDimens.spacing8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusRound),
        ),
      ),
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.darkGray,
        thickness: 1,
        space: 1,
      ),
      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.silver,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.silver,
        ),
      ),
    );
  }

  // Theme Data - Light Mode
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.neonBlue,
      scaffoldBackgroundColor: AppColors.offWhite,
      colorScheme: const ColorScheme.light(
        primary: AppColors.neonBlue,
        secondary: AppColors.neonPurple,
        tertiary: AppColors.neonEmerald,
        surface: AppColors.white,
        error: AppColors.neonRose,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.obsidian,
        onError: AppColors.white,
      ),
      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white.withOpacity(0.8),
        foregroundColor: AppColors.obsidian,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.obsidian,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.obsidian,
          size: AppDimens.iconMedium,
        ),
      ),
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white.withOpacity(0.95),
        selectedItemColor: AppColors.neonBlue,
        unselectedItemColor: AppColors.lightGray,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
        cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: AppColors.obsidian.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
        margin: EdgeInsets.zero,
      ),
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.offWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing16,
          vertical: AppDimens.spacing16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.silver,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.neonBlue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.neonRose,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.neonRose,
            width: 2,
          ),
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.lightGray,
          fontSize: 14,
        ),
        labelStyle: GoogleFonts.inter(
          color: AppColors.lightGray,
          fontSize: 14,
        ),
        prefixIconColor: AppColors.lightGray,
        suffixIconColor: AppColors.lightGray,
      ),
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.neonBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing24,
            vertical: AppDimens.spacing16,
          ),
          minimumSize: const Size(double.infinity, AppDimens.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusXXLarge),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.obsidian,
          side: const BorderSide(color: AppColors.silver, width: 1),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing24,
            vertical: AppDimens.spacing16,
          ),
          minimumSize: const Size(double.infinity, AppDimens.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusXXLarge),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.neonBlue,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.obsidian,
        size: AppDimens.iconMedium,
      ),
      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.neonBlue,
        foregroundColor: AppColors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
      ),
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.offWhite,
        selectedColor: AppColors.neonBlue,
        disabledColor: AppColors.silver,
        labelStyle: GoogleFonts.inter(
          color: AppColors.obsidian,
          fontSize: 12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing12,
          vertical: AppDimens.spacing8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusRound),
        ),
      ),
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.silver,
        thickness: 1,
        space: 1,
      ),
      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColors.obsidian,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.obsidian,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.obsidian,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.obsidian,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.obsidian,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.obsidian,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.obsidian,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.obsidian,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.obsidian,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.obsidian,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.obsidian,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGray,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.obsidian,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.obsidian,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGray,
        ),
      ),
    );
  }
}
