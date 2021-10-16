import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class SliverPlaylistList extends StatelessWidget {
  const SliverPlaylistList();

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: up.Dimensions.space4,
      crossAxisSpacing: up.Dimensions.space4,
      childAspectRatio: 0.8,
      children: List.generate(10, (index) => up.PlaylistCard()),
    );
  }
}
