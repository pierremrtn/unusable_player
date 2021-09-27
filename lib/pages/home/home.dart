import 'package:flutter/material.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

import 'widgets/flexible_header.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: up.SliverPage(
        appBar: context.normalAppBar(
          title: "Unusable Player",
        ),
        padding: EdgeInsets.only(top: up.Dimensions.space5),
        slivers: [
          // SliverAppBar(
          //   flexibleSpace: FlexibleHeader(
          //     tabs: ["Overview", "Artists", "Musics", "Albums"],
          //   ),
          //   backgroundColor: Colors.white,
          //   expandedHeight: kFlexibleHeaderHeight,
          //   floating: true,
          //   pinned: true,
          // ),
          // up.Space1(),
          SliverPadding(
            padding: EdgeInsets.only(
              top: up.Dimensions.space3,
              left: up.Dimensions.space2,
              right: up.Dimensions.space2,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) => up.SongCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
