import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.beigeColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.goldColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF171411),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.goldColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
