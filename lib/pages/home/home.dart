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
        padding: EdgeInsets.zero,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: up.Dimensions.space3,
                horizontal: up.Dimensions.pageMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  context.headline1("Unusable Player"),
                  context.subtitle1("Sexy but unusable"),
                ],
              ),
            ),
          ),
          up.SliverPersistentSearchBar(
            padding: EdgeInsets.only(
              top: up.Dimensions.space3,
              bottom: up.Dimensions.space4,
              left: up.Dimensions.pageMargin,
            ),
          ),
          up.SliverPersistentTabBar(
            tabs: ["Overview", "Artist", "Album", "Songs"],
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: up.Dimensions.space3,
              left: up.Dimensions.pageMargin,
              right: up.Dimensions.pageMargin,
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
