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
            context.headline1(controller.song.title),
            context.subtitle1(controller.song.artist.name),
            const up.Space1(),
            Cover(artwork: controller.song.artwork),
            const up.Space1(),
            controller.obx(
              (controlState) => PlayerControl(
                state: controlState!,
                onSetTime: controller.setTime,
                onSetVolume: controller.setVolume,
                onPlay: controller.play,
                onPause: controller.pause,
                onToggleLoopMode: controller.toggleLoopMode,
                onToggleShuffleMode: controller.toggleShuffleMode,
                onPrevious: controller.previous,
                onNext: controller.next,
              ),
            ),
            const up.Space1(),
          ],
        ),
      ),
    );
  }
}
