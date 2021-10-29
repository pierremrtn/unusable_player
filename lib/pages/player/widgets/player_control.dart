import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'control_background.dart';

class PlayerControl extends StatelessWidget {
  const PlayerControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: ControlBackground(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: up.Dimensions.space4),
          child: up.DoubleBottomCard(
            padding: const EdgeInsets.symmetric(vertical: up.Dimensions.space3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: up.Dimensions.space3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.headline5("01:11"),
                      context.headline5("03:56"),
                    ],
                  ),
                ),
                const up.Space1(),
                Row(
                  children: [
                    up.Button.icon(up.Icons.loop, onPressed: () {}),
                    up.Button.icon(up.Icons.fast_backward, onPressed: () {}),
                    Expanded(
                      child: up.Button.round(
                        onPressed: () {},
                        icon: up.Icons.play,
                        style: up.ButtonStyle.secondary,
                        padding: const EdgeInsets.all(up.Dimensions.space4),
                      ),
                    ),
                    up.Button.icon(up.Icons.fast_forward, onPressed: () {}),
                    up.Button.icon(up.Icons.shuffle, onPressed: () {}),
                  ],
                ),
                const up.Space1(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    context.headline3("Speaker"),
                    const up.Space3(),
                    context.subtitle2("34%"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
