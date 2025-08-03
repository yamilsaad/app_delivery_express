// lib/config/themes/app_theme.dart

import 'package:flutter/material.dart';

class AppColors {
  static const Color deepBlue = Color(0xFF1E40AF);
  static const Color vibrantOrange = Color(0xFFF97316);
  static const Color pureWhite = Color(0xFFFFFFFF);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.pureWhite,
    primaryColor: AppColors.deepBlue,
    fontFamily: 'Nunito', // Nombre de la fuente
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.deepBlue,
      foregroundColor: AppColors.pureWhite,
      centerTitle: true,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.deepBlue,
      secondary: AppColors.vibrantOrange,
    ),
    useMaterial3: true,
  );
}
