import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unusable_player/theme/theme.dart' as up;

const appBarTheme = AppBarTheme(
  backgroundColor: up.Colors.white,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: up.Colors.white,
    systemNavigationBarColor: up.Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
);

const darkAppBarTheme = AppBarTheme(
  backgroundColor: up.Colors.black,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: up.Colors.black,
    systemNavigationBarColor: up.Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ),
);
