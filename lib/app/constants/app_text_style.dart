
import 'package:de_ghuma_ke/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  //.............. Dark Texts ....................
  static const TextStyle headingLargeDark = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.black,
  );

  static const TextStyle bodyRegularDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.darkGrey,
  );

  static const TextStyle captionDark = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: AppColors.grey,
  );

  // .................... Light texts .................
  static const TextStyle headingLargeWhite = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.white,
  );

  static const TextStyle bodyRegularWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.white,
  );

  static const TextStyle captionWhite = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: AppColors.white,
  );
}
