import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

//TODO: Redesign

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    required this.artist,
    this.onTap,
  });

  final up.Artist artist;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      onTap: onTap,
      padding: up.Dimensions.space4,
      child: Row(
        children: [
          up.Image.s3(AssetImage("assets/skeler.jpg")),
          up.Space4(),
          Expanded(
            child: context.headline5(artist.name),
          ),
        ],
      ),
    );
  }
}
