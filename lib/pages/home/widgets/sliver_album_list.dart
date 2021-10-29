import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SliverAlbumList extends StatelessWidget {
  const SliverAlbumList({
    required this.albums,
    required this.onSelectAlbum,
    Key? key,
  }) : super(key: key);

  final List<up.Album> albums;
  final void Function(up.Album) onSelectAlbum;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: up.Dimensions.space4,
      crossAxisSpacing: up.Dimensions.space4,
      childAspectRatio: 0.8,
      children: albums
          .mapIndexed(
            (index, album) => up.AlbumCard(
              album: album,
              onTap: () => onSelectAlbum(albums[index]),
            ),
          )
          .toList(),
    );
  }
}
