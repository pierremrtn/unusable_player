import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:unusable_player/unusable_player.dart' as up;

final int _minAnimDurationMS = up.Feel.animationDuration.inMilliseconds;
final int _maxAnimDurationMS = up.Feel.animationDuration.inMilliseconds * 3;

class TiedAlbumCard extends StatelessWidget {
  const TiedAlbumCard({
    required this.random,
    required this.album,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Random random;
  final VoidCallback? onTap;
  final up.Album album;

  int get _animDuration =>
      ((_maxAnimDurationMS - _minAnimDurationMS) * random.nextDouble())
          .toInt() +
      _minAnimDurationMS;

  @override
  Widget build(BuildContext context) {
    return up.Suspended(
      random: random,
      child: up.AlbumCard(
        album: album,
        onTap: onTap,
      ),
    );
  }
}
