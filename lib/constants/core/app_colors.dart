import 'package:flutter/material.dart';

class AppColors {
  // Text Colors
  static const Color textPrimary = Color(0xFF000000); // Black
  static const Color textSecondary = Color(0xFF565656); // Dark Gray

  // Background Colors
  static const Color backgroundPrimary = Color(0xFFE9E9E9); // Light Gray
  static const Color backgroundSecondary = Color(0xFFDFDFDF); // Lighter Gray
  static const Color backgroundTertiary =
      Color(0xFFB7B7B7); // Even Lighter Gray

  // Primary Colors
  static const Color primary100 = Color(0xFF8B0000); // Dark Red
  static const Color primary200 = Color(0xFFC2402A); // Rust Red
  static const Color primary300 = Color(0xFFFEDED3);
  static const Color primary400 = Color(0xFFEF9A9A);

  // Accent Colors
  static const Color accent100 = Color(0xFFFF6347); // Tomato Red
  static const Color accent200 = Color(0xFF8D0000); // Darker Red

  // Additional Colors
  static const Color red = Color(0xFFFF0000); // Red
  static const Color green = Color(0xFF00FF00); // Green
  static const Color blue = Color(0xFF0000FF); // Blue
  static const Color white = Color(0xFFFFFFFF); // White
  static const Color yellow = Color(0xFFFFFF00); // Yellow
  static const Color purple = Color(0xFF800080); // Purple
  static const Color orange = Color(0xFFFFA500); // Orange
  static const Color cyan = Color(0xFF00FFFF); // Cyan
  static const Color magenta = Color(0xFFFF00FF); // Magenta
  static const Color brown = Color(0xFFA52A2A); // Brown
  static const Color pink = Color(0xFFFFC0CB); // Pink
  static const Color teal = Color(0xFF008080); // Teal
  static const Color indigo = Color(0xFF4B0082); // Indigo
  static const Gradient gradientLinearGradient = RadialGradient(
    colors: [
      AppColors.primary300,
      AppColors.accent100,
      AppColors.textSecondary,
    ],
  );
}
