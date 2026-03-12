import 'package:flutter/material.dart';

/// App Colors - Cyber-Luxury Theme
/// Base: #050505 (Obsidian) with Neon-Vibrant accents
class AppColors {
  AppColors._();

  // Base Colors
  static const Color obsidian = Color(0xFF050505);
  static const Color darkBlack = Color(0xFF0A0A0A);
  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color darkGray = Color(0xFF2D2D2D);
  static const Color mediumGray = Color(0xFF404040);
  static const Color lightGray = Color(0xFF6B6B6B);
  static const Color silver = Color(0xFF9E9E9E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color cream = Color(0xFFFAF9F6);

  // Neon Accent Colors
  static const Color neonBlue = Color(0xFF2563EB);
  static const Color neonBlueLight = Color(0xFF3B82F6);
  static const Color neonBlueDark = Color(0xFF1D4ED8);
  
  static const Color neonEmerald = Color(0xFF10B981);
  static const Color neonEmeraldLight = Color(0xFF34D399);
  static const Color neonEmeraldDark = Color(0xFF059669);
  
  static const Color neonRose = Color(0xFFF43F5E);
  static const Color neonRoseLight = Color(0xFFFB7185);
  static const Color neonRoseDark = Color(0xFFE11D48);
  
  static const Color neonPurple = Color(0xFF8B5CF6);
  static const Color neonPurpleLight = Color(0xFFA78BFA);
  static const Color neonPurpleDark = Color(0xFF7C3AED);
  
  static const Color neonOrange = Color(0xFFF97316);
  static const Color neonOrangeLight = Color(0xFFFB923C);
  static const Color neonOrangeDark = Color(0xFFEA580C);
  
  static const Color neonCyan = Color(0xFF06B6D4);
  static const Color neonCyanLight = Color(0xFF22D3EE);
  static const Color neonCyanDark = Color(0xFF0891B2);
  
  static const Color neonYellow = Color(0xFFFBBF24);
  static const Color neonYellowLight = Color(0xFFFCD34D);
  static const Color neonYellowDark = Color(0xFFD97706);

  // Service Category Colors (as per design)
  static const Color atmBlue = neonBlue;
  static const Color transitEmerald = neonEmerald;
  static const Color medicalRose = neonRose;
  static const Color hotelPurple = neonPurple;
  static const Color restaurantOrange = neonOrange;
  static const Color travelCyan = neonCyan;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neonBlue, neonPurple],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [obsidian, darkBlack],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x20FFFFFF),
      Color(0x10FFFFFF),
    ],
  );

  static const LinearGradient placeCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0x80000000),
      Color(0xCC000000),
    ],
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      darkGray,
      mediumGray,
      darkGray,
    ],
  );

  // Semantic Colors
  static const Color success = neonEmerald;
  static const Color warning = neonOrange;
  static const Color error = neonRose;
  static const Color info = neonBlue;

  // Glass Effect Colors
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassHighlight = Color(0x0DFFFFFF);

  // Dark Theme Colors
  static const Color backgroundDark = obsidian;
  static const Color surfaceDark = charcoal;
  static const Color textPrimaryDark = white;
  static const Color textSecondaryDark = silver;
  static const Color borderDark = darkGray;

  // Light Theme Colors
  static const Color backgroundLight = offWhite;
  static const Color surfaceLight = white;
  static const Color textPrimaryLight = darkBlack;
  static const Color textSecondaryLight = mediumGray;
  static const Color borderLight = lightGray;

  // Status Colors
  static const Color neonGreen = neonEmerald;
}
