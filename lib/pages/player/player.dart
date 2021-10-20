import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'widgets/cover.dart';
import 'widgets/player_control.dart';

class Player extends StatelessWidget {
  const Player();

  @override
  Widget build(BuildContext context) {
    return up.Page(
      appBar: up.normalAppBar(
        context: context,
        title: "Now playing",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.headline1("Music title"),
          context.subtitle1("artist"),
          up.Space1(),
          Cover(),
          up.Space1(),
          PlayerControl(),
        ],
      ),
    );
  }
}
