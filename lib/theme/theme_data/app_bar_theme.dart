import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unusable_player/theme/theme.dart' as up;

final appBarTheme = AppBarTheme(
  backgroundColor: up.Colors.white,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: up.Colors.white,
    systemNavigationBarColor: up.Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
);
