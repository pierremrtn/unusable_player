import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'widgets/cover.dart';
import 'widgets/player_control.dart';
import 'player_controller.dart';

export 'player_bindings.dart';
export 'models/player_parameters.dart';

class PlayerPage extends GetView<PlayerController> {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return up.Page(
      padding: const up.PaddingPage.vertical(),
      appBar: up.normalAppBar(
        context: context,
        title: "Now playing",
      ),
      body: Obx(
        () {
          final song = controller.song;
          if (song == null) {
            return const SizedBox.shrink();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const up.PaddingPage.horizontal(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    context.headline1(song.title),
                    context.subtitle1(song.artist.name),
                  ],
                ),
              ),
              const up.Space1(),
              Cover(
                artwork: song.artwork,
                controller: controller.coverController,
              ),
              const up.Space1(),
              Padding(
                padding: const up.PaddingPage.horizontal(),
                child: controller.obx(
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
              ),
              const up.Space1(),
            ],
          );
        },
      ),
    );
  }
}
