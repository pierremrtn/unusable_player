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

class AudioQueryService extends GetxService {
  static AudioQueryService get get => Get.find<AudioQueryService>();

  Future<AudioQueryService> init() async {
    final songsModelList = await _audioQuery.querySongs();
    songs.addAll(
      songsModelList
          .map((model) => model.toSong())
          .where((e) => e != null)
          .map((e) => e!)
          .toList(),
    );
    return this;
  }

  final OnAudioQuery _audioQuery = OnAudioQuery();
  final RxList<Song> songs = RxList();
}
