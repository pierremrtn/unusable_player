import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'widgets/inner_list.dart';
import 'widgets/sliver_playlist_list.dart';
import 'widgets/sliver_song_list.dart';

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
                InnerList(
                  storageKey: "home_artists",
                  sliver: SliverSongList(
                    songs: up.AudioQueryService.get.songs,
                  ),
                ),
                InnerList(
                  storageKey: "home_albums",
                  sliver: SliverSongList(
                    songs: up.AudioQueryService.get.songs,
                  ),
                ),
                InnerList(
                  storageKey: "home_overview",
                  sliver: SliverPlaylistList(),
                ),
                InnerList(
                  storageKey: "home_songs",
                  sliver: SliverSongList(
                    songs: up.AudioQueryService.get.songs,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
