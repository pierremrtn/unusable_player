import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

typedef OnSongTap = void Function(up.Song);

class SliverSongList extends StatelessWidget {
  const SliverSongList({
    required this.songs,
    this.onSongTap,
    Key? key,
  }) : super(key: key);

  final List<up.Song> songs;
  final OnSongTap? onSongTap;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: up.SongCard(
              song: songs[index],
              onTap: onSongTap != null ? () => onSongTap!(songs[index]) : null,
            ),
          );
        },
        childCount: songs.length,
      ),
    );
  }
}
