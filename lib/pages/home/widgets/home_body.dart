import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'search_results.dart';
import 'sliver_song_list.dart';
import 'artist_list_tab.dart';
import 'song_list_tab.dart';
import 'album_list_tab.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    required this.showSearchResults,
    required this.onSelectSong,
    Key? key,
  }) : super(key: key);

  final bool showSearchResults;
  final SelectSongCallback onSelectSong;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: up.Feel.animationDuration,
      switchInCurve: up.Feel.animationCurve,
      switchOutCurve: up.Feel.animationCurve,
      transitionBuilder: _transitionBuilder,
      child: showSearchResults ? _buildSearchResults() : _buildTabBarView(),
    );
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    final offsetTween =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: offsetTween.animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSearchResults() => SearchResults(
        onSelectSong: onSelectSong,
      );

  Widget _buildTabBarView() => TabBarView(
        children: [
          SongListTab(
            onSelectSong: onSelectSong,
          ),
          ArtistListTab(
            onSelectSong: onSelectSong,
          ),
          AlbumListTab(
            onSelectSong: onSelectSong,
          ),
        ],
      );
}
