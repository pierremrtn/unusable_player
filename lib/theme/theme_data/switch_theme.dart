import 'package:flutter/material.dart';
import 'package:unusable_player/theme/colors.dart' as up;

final switchTheme = SwitchThemeData(
  thumbColor: MaterialStateProperty.all(up.Colors.black),
  trackColor: MaterialStateProperty.all(up.Colors.mediumGrey),
);

final darkSwitchTheme = SwitchThemeData(
  thumbColor: MaterialStateProperty.all(up.Colors.white),
  trackColor: MaterialStateProperty.all(up.Colors.mediumGrey),
);
