import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      primary: AppColors.blue,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide: const BorderSide(color: AppColors.gray, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide: const BorderSide(color: AppColors.gray, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide: const BorderSide(color: AppColors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide: const BorderSide(color: AppColors.red, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      errorStyle: TextStyle(color: AppColors.red, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.blue),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.blue),
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: AppColors.black,
      ),
    ),
  );
}
