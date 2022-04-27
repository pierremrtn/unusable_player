import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

typedef SelectSongCallback = void Function(List<up.Song>, int);

const int _minAnimDurationMS = 300;
const int _maxAnimDurationMS = 1000;

class SliverSongList extends StatelessWidget {
  SliverSongList({
    required this.songs,
    this.onSelectSong,
    Key? key,
  }) : super(key: key);

  final List<up.Song> songs;
  final SelectSongCallback? onSelectSong;
  final _random = Random();

  int get _animDuration =>
      ((_maxAnimDurationMS - _minAnimDurationMS) * _random.nextDouble())
          .toInt() +
      _minAnimDurationMS;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(bottom: up.Dimensions.space3),
          child: FlipInX(
            duration: Duration(milliseconds: _animDuration),
            child: up.Tied(
              minAngle: -0.01,
              maxAngle: 0.01,
              random: _random,
              child: up.SongCard(
                song: songs[index],
                onTap: onSelectSong != null
                    ? () => onSelectSong!(songs, index)
                    : null,
              ),
            ),
          ),
        ),
        childCount: songs.length,
      ),
    );
  }
}
