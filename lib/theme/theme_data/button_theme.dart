import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/theme/theme_data/colors_scheme.dart';

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    padding: MaterialStateProperty.all(
      EdgeInsets.all(
        AppDimensions.space4,
      ),
    ),
    overlayColor: MaterialStateProperty.all(AppColors.white),
    backgroundColor: MaterialStateProperty.all(AppColors.blue),
    foregroundColor: MaterialStateProperty.all(AppColors.black),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadius3,
        ),
      ),
    ),
    minimumSize: MaterialStateProperty.all(
      Size(
        AppDimensions.space5,
        AppDimensions.space5,
      ),
    ),
    side: MaterialStateProperty.all(
      BorderSide(
        color: AppColors.black,
        width: AppDimensions.borderSize,
      ),
    ),
  ),
);
