import 'package:flutter/material.dart';
import 'package:unusable_player/theme/colors.dart' as up;

final _trackColor = MaterialStateProperty.resolveWith((states) {
  if (states.contains(MaterialState.selected)) {
    return up.Colors.blue;
  }
  return up.Colors.mediumGrey;
});

final switchTheme = SwitchThemeData(
  thumbColor: MaterialStateProperty.all(up.Colors.black),
  trackColor: _trackColor,
);

final darkSwitchTheme = SwitchThemeData(
  thumbColor: MaterialStateProperty.all(up.Colors.white),
  trackColor: _trackColor,
);
