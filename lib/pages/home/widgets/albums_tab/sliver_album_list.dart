import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SliverAlbumList extends StatelessWidget {
  const SliverAlbumList({
    required this.albums,
  });

  final List<up.Album> albums;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: up.Dimensions.space4,
      crossAxisSpacing: up.Dimensions.space4,
      childAspectRatio: 0.8,
      children: albums
          .map(
            (album) => up.AlbumCard(album: album),
          )
          .toList(),
    );
  }
}
