import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

import 'song_list/song_list.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: up.emptyAppBar(),
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) =>
                [
              if (!innerBoxIsScrolled)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: up.Dimensions.pageMargin,
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
                forceExpandSeparator: innerBoxIsScrolled,
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: up.Dimensions.pageMargin,
              ),
              child: TabBarView(
                dragStartBehavior: DragStartBehavior.down,
                children: [
                  SongList(),
                  Text("2"),
                  Text("3"),
                  Text("4"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
