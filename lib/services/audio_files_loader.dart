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
  Future<AudioFilesLoader> init() async {
    await _ensurePermissionGranted();
    await _queryAudioFiles();
    return this;
  }

  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<void> _ensurePermissionGranted() async {
    while (await _audioQuery.permissionsStatus() == false) {
      await _audioQuery.permissionsRequest();
    }
  }

  Future<void> _queryAudioFiles() async {
    try {
      final List<SongModel> queryResult = await _audioQuery.querySongs();
      final List<Song> songs = queryResult
          .map((model) => model.toSong())
          .where((e) => e != null)
          .map((e) => e!)
          .toList();
      change(
        songs,
        status: songs.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
