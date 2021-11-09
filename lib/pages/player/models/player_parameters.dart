import 'package:unusable_player/unusable_player.dart' as up;

class PlayerParameters {
  const PlayerParameters({
    required this.songs,
    required this.index,
  });
  const PlayerParameters.openCurrentSong()
      : songs = null,
        index = null;
  final List<up.Song>? songs;
  final int? index;

  bool get openCurrentSong => songs == null || index == null;
}
