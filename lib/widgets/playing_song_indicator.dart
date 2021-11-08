import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'package:neat/neat.dart';

class PlayingSongIndicator extends StatelessWidget {
  const PlayingSongIndicator({
    Key? key,
    required this.song,
    this.isPlaying = true,
    this.onPlay,
    this.onPause,
    this.onTap,
  }) : super(key: key);

  final up.Song song;
  final bool isPlaying;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = Theme.of(context).colorScheme.surface;

    return up.DoubleBottomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(up.Dimensions.space3),
      backgroundColor: context.colorScheme.primary,
      bottomColor: context.colorScheme.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            up.Icons.cd,
            color: foregroundColor,
          ),
          const up.Space4(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.bodyText1(
                  song.artist.name,
                  style: TextStyle(color: foregroundColor),
                ),
                context.headline5(
                  song.title,
                  style: TextStyle(color: foregroundColor),
                ),
              ],
            ),
          ),
          const up.Space4(),
          up.Button.icon(
            isPlaying ? up.Icons.pause : up.Icons.play,
            onPressed: isPlaying ? onPause : onPlay,
            color: foregroundColor,
          ),
        ],
      ),
    );
  }
}
