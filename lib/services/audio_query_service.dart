import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:unusable_player/models/models.dart';

extension _ToSong on SongModel {
  Song? toSong() => uri != null
      ? Song(
          title: title,
          duration: Duration(milliseconds: duration ?? 0),
          uri: uri!,
          artist: artist,
          album: album,
        )
      : null;
}

class AudioFilesLoader extends GetxController with StateMixin<List<Song>> {
  static AudioFilesLoader get get => Get.find<AudioFilesLoader>();

  Future<AudioFilesLoader> init() async {
    await _queryAudioFiles();
    return this;
  }

  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<void> _queryAudioFiles() async {
    try {
      final songsModelList = await _audioQuery.querySongs();
      final songs = songsModelList
          .map((model) => model.toSong())
          .where((e) => e != null)
          .map((e) => e!)
          .toList();

      change(songs, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
