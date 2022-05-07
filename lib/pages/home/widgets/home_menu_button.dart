import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeMenuButton extends StatelessWidget {
  const HomeMenuButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: up.Dimensions.icon1,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: controller,
      ),
      onPressed: Scaffold.of(context).openDrawer,
    );
  }
}
