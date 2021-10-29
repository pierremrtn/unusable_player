import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class ControlBackground extends StatelessWidget {
  const ControlBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: up.Dimensions.space3),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onSurface,
          width: up.Dimensions.borderSize,
        ),
        borderRadius: BorderRadius.circular(up.Dimensions.borderRadius1),
        color: context.colorScheme.primary,
      ),
      child: Container(
        margin: const EdgeInsets.all(up.Dimensions.space5),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.onSurface,
            width: up.Dimensions.borderSize,
          ),
          borderRadius: BorderRadius.circular(up.Dimensions.borderRadius2),
          color: context.colorScheme.secondary,
        ),
        // child: SizedBox.expand(),
      ),
    );
  }
}
