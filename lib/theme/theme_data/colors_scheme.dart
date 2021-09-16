import 'package:flutter/material.dart';

///This class is intended to be used in theme declaration only
///Do not use this class in widgets
///use Theme.of(context).colorScheme instead
class AppColors {
  static const Color red = Color(0xffE85F5B);
  static const Color lightRed = Color(0xffFBF8F1);
  static const Color blue = Color(0xff2AB4C1);
  static const Color orange = Color(0xffF8BC73);

  static const Color lightGrey = Color(0xffA8A8A8);
  static const Color mediumGrey = Color(0xff7C8384);
  static const Color darkGrey = Color(0xff1D1D1D);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
}

final colorScheme = ColorScheme.light(
  primary: AppColors.blue,
  secondary: AppColors.orange,
  secondaryVariant: AppColors.lightRed,
  error: AppColors.red,
  background: AppColors.white,
  onSurface: AppColors.black,
  onBackground: AppColors.black,
);
