import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SliverPlaylistList extends StatelessWidget {
  const SliverPlaylistList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: up.Dimensions.space4,
      crossAxisSpacing: up.Dimensions.space4,
      childAspectRatio: 0.8,
      children: List.generate(10, (index) => const up.PlaylistCard()),
    );
  }
}
