import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class NormalAppBar extends AppBar {
  NormalAppBar({
    required String title,
    VoidCallback? onBack,
  }) : super(
          title: Headline3(title),
          centerTitle: true,
          backgroundColor: Get.theme.colorScheme.background,
          elevation: 0,
          leadingWidth: _leadingWidth,
          leading: onBack != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: up.Button(
                    icon: up.Icons.left,
                    onPressed: onBack,
                  ),
                )
              : null,
          toolbarHeight: _toolbarHeight,
        );

  static double get _leadingWidth => up.Dimensions.space2 + up.Button.size;
  static double get _toolbarHeight => up.Button.size;
}
