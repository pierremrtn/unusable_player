import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'widgets/cover.dart';
import 'widgets/player_control.dart';
import 'player_controller.dart';

export 'player_bindings.dart';

class Player extends GetView<PlayerController> {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return up.Page(
      appBar: up.normalAppBar(
        context: context,
        title: "Now playing",
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.headline1(controller.displayedSong.title),
            context.subtitle1(controller.displayedSong.artist.name),
            const up.Space1(),
            Cover(artwork: controller.displayedSong.artwork),
            const up.Space1(),
            Obx(
              () => PlayerControl(
                state: controller.controlState,
                onSetTime: controller.setTime,
                onPlay: controller.play,
                onPause: controller.pause,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
