import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResumeColors {
  static const background = Color(0xFFF3F4F8);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceLight = Color(0xFFF9FAFB);
  static const accent = Color(0xFF4F46E5);
  static const accentSoft = Color(0xFFEEF2FF);
  static const accentSoft2 = Color(0xFFE0E7FF);
  static const textPrimary = Color(0xFF111827);
  static const textSecondary = Color(0xFF6B7280);
  static const border = Color(0xFFE5E7EB);
  static const heroPrimary = Color(0xFF312E81);
  static const heroSecondary = Color(0xFF2563EB);
  static const heroAccentText = Color(0xFFC7D2FE);
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ResumeColors.background,
    fontFamily: 'Inter',
  );

  return base.copyWith(
    colorScheme: const ColorScheme.light(
      primary: ResumeColors.accent,
      surface: ResumeColors.surface,
      onSurface: ResumeColors.textPrimary,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: ResumeColors.textPrimary,
      displayColor: ResumeColors.textPrimary,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}