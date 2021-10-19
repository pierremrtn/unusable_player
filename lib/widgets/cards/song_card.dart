import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/unusable_player.dart' as up;

class SongCard extends StatelessWidget {
  const SongCard({
    required this.song,
  });

  final up.Song song;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      padding: up.Dimensions.space4,
      child: Row(
        children: [
          up.Image.s3(AssetImage("assets/skeler.jpg")),
          up.Space4(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline5(song.artist.name),
                up.Space5(),
                Row(
                  children: [
                    Expanded(
                      child: context.subtitle2(song.title),
                    ),
                    context.bodyText2("${song.duration.display}"),
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
