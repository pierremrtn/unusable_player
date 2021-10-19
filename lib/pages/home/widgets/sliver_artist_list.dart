import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SliverArtistList extends StatelessWidget {
  const SliverArtistList({
    required this.artists,
    required this.onSelectArtist,
  });

  final List<up.Artist> artists;
  final void Function(up.Artist) onSelectArtist;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: up.ArtistCard(
              artist: artists[index],
              onTap: () => onSelectArtist(artists[index]),
            ),
          );
        },
        childCount: artists.length,
      ),
    );
  }
}
