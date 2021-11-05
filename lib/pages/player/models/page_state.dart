import 'package:unusable_player/models/song.dart';

class PageState {
  PageState({
    required this.displayedSong,
    required this.displayPlayingSong,
  });
  Song? displayedSong;
  bool displayPlayingSong;
}
