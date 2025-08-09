// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.lightBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColor.primary,
      onPrimary: Colors.white,
      secondary: AppColor.green,
      error: AppColor.error,
      background: AppColor.lightBg,
      onBackground: AppColor.lightText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.lightInput,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.lightBorder),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColor.lightText),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryDark,
    scaffoldBackgroundColor: AppColor.darkBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColor.primaryDark,
      onPrimary: Colors.white,
      secondary: AppColor.green,
      error: AppColor.error,
      background: AppColor.darkBg,
      onBackground: AppColor.darkText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.darkInput,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.darkBorder),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColor.darkText),
    ),
  );
}
