import 'package:flutter/material.dart';

import 'package:unusable_player/unusable_player.dart' as up;

const drawerTheme = DrawerThemeData(
  backgroundColor: up.Colors.white,
  elevation: 0,
  shape: ContinuousRectangleBorder(
    side: BorderSide(
      color: up.Colors.black,
      style: BorderStyle.none,
      width: up.Dimensions.borderSize,
    ),
  ),
);

const darkDrawerTheme = DrawerThemeData(
  backgroundColor: up.Colors.black,
  elevation: 0,
  shape: ContinuousRectangleBorder(
    side: BorderSide(
      color: up.Colors.white,
      style: BorderStyle.none,
      width: up.Dimensions.borderSize,
    ),
  ),
);
