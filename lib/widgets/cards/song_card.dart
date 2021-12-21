import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/unusable_player.dart' as up;

class SongCard extends StatelessWidget {
  const SongCard({
    required this.song,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final up.Song song;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      bottomColor: song.artwork?.dominantColor,
      onTap: onTap,
      padding: const EdgeInsets.all(up.Dimensions.space4),
      child: Row(
        children: [
          up.Image.s3(
            song.artwork?.image ?? const AssetImage("assets/skeler.jpg"),
          ),
          const up.Space4(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline5(
                  song.title,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const up.Space5(),
                Row(
                  children: [
                    Expanded(
                      child: context.subtitle2(song.artist.name),
                    ),
                    context.bodyText2(song.duration.display),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
