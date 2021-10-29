import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SliverSongList extends StatelessWidget {
  const SliverSongList({
    required this.songs,
    Key? key,
  }) : super(key: key);

  final List<up.Song> songs;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: up.SongCard(
              song: songs[index],
            ),
          );
        },
        childCount: songs.length,
      ),
    );
  }
}
