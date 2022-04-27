import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

typedef SelectSongCallback = void Function(List<up.Song>, int);

class SliverSongList extends StatelessWidget {
  SliverSongList({
    required this.songs,
    this.onSelectSong,
    Key? key,
  }) : super(key: key);

  final List<up.Song> songs;
  final SelectSongCallback? onSelectSong;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(bottom: up.Dimensions.space3),
          child: up.RopedSongCard(
            random: _random,
            song: songs[index],
            onTap:
                onSelectSong != null ? () => onSelectSong!(songs, index) : null,
          ),
        ),
        childCount: songs.length,
      ),
    );
  }
}
