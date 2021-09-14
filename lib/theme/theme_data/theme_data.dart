import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme_data/button_theme.dart';
import 'package:unusable_player/theme/theme_data/colors_scheme.dart';
import 'package:unusable_player/theme/theme_data/text_theme.dart';

final lightTheme = ThemeData(
  fontFamily: "Montserrat",
  textTheme: textTheme,
  colorScheme: colorScheme,
  outlinedButtonTheme: outlinedButtonTheme,

  //Actually, colorScheme isn't fully suported
  //use leagcy themeColor here
  //theses colors should match colorScheme
  dividerColor: AppColors.mediumGrey,
  backgroundColor: AppColors.white,
);
