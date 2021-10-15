import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:unusable_player/unusable_player.dart' as up;

extension _ToSong on SongModel {
  up.Song? toSong() => uri != null
      ? up.Song(
          title: title,
          duration: Duration(milliseconds: duration ?? 0),
          uri: uri!,
          artist: artist,
          album: album,
        )
      : null;
}

class AudioQueryService extends GetxService {
  static AudioQueryService get find => Get.find<AudioQueryService>();

  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<List<up.Song>> querySongs() async {
    final List<SongModel> queryResult = await _audioQuery.querySongs();
    return queryResult
        .map((model) => model.toSong())
        .where((e) => e != null)
        .map((e) => e!)
        .toList();
  }
}
