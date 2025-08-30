
import 'package:de_ghuma_ke/app/constants/app_colors.dart';
import 'package:de_ghuma_ke/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle:  AppTextStyles.headingLargeWhite
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800], // Dark button
            foregroundColor: AppColors.white, // Text color
          ),
        ),
      );
}
