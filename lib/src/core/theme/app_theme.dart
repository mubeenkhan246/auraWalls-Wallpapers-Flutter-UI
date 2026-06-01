import 'package:flutter/material.dart';

class AuraColors {
  static const deepBlack = Color(0xFF09090B);
  static const graphite = Color(0xFF18181B);
  static const electricPurple = Color(0xFF8B5CF6);
  static const neonBlue = Color(0xFF3B82F6);
  static const softWhite = Color(0xFFFAFAFA);
}

class AppTheme {
  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: AuraColors.electricPurple,
      brightness: Brightness.dark,
      surface: AuraColors.graphite,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AuraColors.deepBlack,
      colorScheme: scheme.copyWith(
        primary: AuraColors.electricPurple,
        secondary: AuraColors.neonBlue,
        surface: AuraColors.graphite,
      ),
      fontFamily: 'SF Pro Display',
      textTheme: Typography.whiteCupertino.apply(
        bodyColor: AuraColors.softWhite,
        displayColor: AuraColors.softWhite,
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: AuraColors.electricPurple),
      scaffoldBackgroundColor: AuraColors.softWhite,
    );
  }
}
