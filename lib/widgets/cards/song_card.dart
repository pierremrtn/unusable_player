import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/unusable_player.dart' as up;

class SongCard extends StatelessWidget {
  const SongCard({
    required this.song,
    Key? key,
  }) : super(key: key);

  final up.Song song;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      padding: const EdgeInsets.all(up.Dimensions.space4),
      child: Row(
        children: [
          const up.Image.s3(AssetImage("assets/skeler.jpg")),
          const up.Space4(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline5(song.artist.name),
                const up.Space5(),
                Row(
                  children: [
                    Expanded(
                      child: context.subtitle2(song.title),
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
