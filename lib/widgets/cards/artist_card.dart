import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    required this.artist,
    this.onTap,
    this.bottomColor,
    Key? key,
  }) : super(key: key);

  final up.Artist artist;
  final VoidCallback? onTap;
  final Color? bottomColor;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      onTap: onTap,
      bottomColor: bottomColor,
      padding: const EdgeInsets.all(up.Dimensions.space4),
      borderRadius: up.Dimensions.borderRadius2,
      child: Row(
        children: [
          Expanded(
            child: context.headline5(artist.name),
          ),
          const up.Space4(),
          context.bodyText1(
            "song_number".trPluralParams(
              "song_number_plural",
              artist.numberOfTracks,
              {"number": artist.numberOfTracks.toString()},
            ),
          )
        ],
      ),
    );
  }
}
