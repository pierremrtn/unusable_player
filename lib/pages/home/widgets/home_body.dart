import 'package:flutter/material.dart';
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
    if (showSearchResults) {
      return SearchResults(
        onSelectSong: onSelectSong,
      );
    } else {
      return TabBarView(
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
  }
}
