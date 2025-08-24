
import 'package:box_cricket/app/constants/app_colors.dart';
import 'package:box_cricket/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          iconTheme: IconThemeData(color: AppColors.white),
          titleTextStyle:  AppTextStyles.headingLargeWhite
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, // Button color
            foregroundColor: AppColors.white, // Text color
          ),
        ),
      );
}
