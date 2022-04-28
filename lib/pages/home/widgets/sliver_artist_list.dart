import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SliverArtistList extends StatelessWidget {
  SliverArtistList({
    required this.artists,
    required this.onSelectArtist,
    Key? key,
  }) : super(key: key);

  final List<up.Artist> artists;
  final void Function(up.Artist) onSelectArtist;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    final colorService = up.ColorService.instance;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: up.Dimensions.padding3),
            child: up.TiedArtistCard(
              bottomColor: colorService.nextColor(),
              random: _random,
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
