import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

const tmpListLength = 30;

class SongList extends StatelessWidget {
  const SongList();

  static const int itemCount = tmpListLength + 2;
  EdgeInsets buildPadding(int index) => index < itemCount - 1
      ? EdgeInsets.only(top: up.Dimensions.space3)
      : EdgeInsets.symmetric(vertical: up.Dimensions.space3);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: buildPadding(index),
        child: up.SongCard(),
      ),
      itemCount: itemCount,
    );
  }
}
