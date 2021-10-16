import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'tabs/songs_tab/song_list_tab.dart';
import 'tabs/home_inner_list.dart';
import 'tabs/sliver_playlist_list.dart';

export 'home_bindings.dart';

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
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: up.SliverPersistentTabBar(
                  tabs: ["Overview", "Songs", "Playlists", "Artists"],
                  forceExpandSeparator: innerBoxIsScrolled,
                ),
              ),
            ],
            body: TabBarView(
              dragStartBehavior: DragStartBehavior.down,
              children: [
                HomeInnerList(
                  storageKey: "home_overview",
                  sliver: SliverPlaylistList(),
                ),
                SongListTab(),
                HomeInnerList(
                  storageKey: "home_playlists",
                  sliver: SliverPlaylistList(),
                ),
                HomeInnerList(
                  storageKey: "home_artists",
                  sliver: SliverPlaylistList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
