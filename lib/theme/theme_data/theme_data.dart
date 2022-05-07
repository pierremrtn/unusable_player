import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/theme/theme_data/divider_theme.dart';

import 'button_theme.dart';
import 'colors_scheme.dart';
import 'list_tile_theme.dart';
import 'text_theme.dart';
import 'app_bar_theme.dart';
import 'slider_theme.dart';

final lightTheme = ThemeData(
  fontFamily: "Montserrat",
  textTheme: textTheme,
  colorScheme: colorScheme,
  outlinedButtonTheme: outlinedButtonTheme,
  appBarTheme: appBarTheme,
  dividerTheme: dividerTheme,
  sliderTheme: sliderTheme,
  listTileTheme: listTileTheme,

  //Actually, colorScheme isn't fully suported
  //use leagcy themeColor here
  //theses colors should match colorScheme
  dividerColor: up.Colors.mediumGrey,
  backgroundColor: up.Colors.white,
);

final darkTheme = ThemeData(
  fontFamily: "Montserrat",
  textTheme: darkTextTheme,
  colorScheme: darkColorScheme,
  outlinedButtonTheme: outlinedButtonTheme,
  appBarTheme: darkAppBarTheme,
  dividerTheme: dividerTheme,
  sliderTheme: sliderTheme,
  listTileTheme: darkListTileTheme,

  //Actually, colorScheme isn't fully suported
  //use leagcy themeColor here
  //theses colors should match colorScheme
  dividerColor: up.Colors.mediumGrey,
  backgroundColor: up.Colors.white,
);
