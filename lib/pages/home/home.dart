import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: up.SliverPage(
        appBar: up.normalAppBar(
          context: context,
          title: "Unusable Player",
        ),
        padding: EdgeInsets.zero,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline1("Listening Every days"),
                context.subtitle1("Explore Millions music evrydays"),
                up.Space3(),
                up.SearchBar(),
                up.Space3(),
              ],
            ),
          ),
          up.SliverPersistentTabBar(
            tabs: ["Overview", "Artist", "Album", "Songs"],
          ),
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
