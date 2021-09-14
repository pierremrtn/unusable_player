import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/widgets/button.dart';

//TODO: remove leading, use a row instead of title

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
                  child: Button(
                    icon: UnusablePlayerIcons.left,
                    onPressed: onBack,
                  ),
                )
              : null,
          toolbarHeight: _toolbarHeight,
        );

  static double get _leadingWidth => AppDimensions.space2 + Button.size;
  static double get _toolbarHeight => Button.size;
}
