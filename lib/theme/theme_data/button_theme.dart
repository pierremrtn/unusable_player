import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:unusable_player/theme/theme.dart' as up;

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(
        up.Dimensions.space4,
      ),
    ),
    overlayColor: MaterialStateProperty.all(up.Colors.white),
    backgroundColor: MaterialStateProperty.all(up.Colors.blue),
    foregroundColor: MaterialStateProperty.all(up.Colors.black),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          up.Dimensions.borderRadius3,
        ),
      ),
    ),
    minimumSize: MaterialStateProperty.all(
      const Size(
        up.Dimensions.space5,
        up.Dimensions.space5,
      ),
    ),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: up.Colors.black,
        width: up.Dimensions.borderSize,
      ),
    ),
  ),
);
