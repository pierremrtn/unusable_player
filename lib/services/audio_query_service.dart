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

extension _ToAlbum on AlbumModel {
  up.Album toAlbum() => up.Album(
        title: album,
        artist: artist ?? "Unknown",
        songNumber: numOfSongs,
      );
}

class AudioQueryService extends GetxService {
  static AudioQueryService get instance => Get.find<AudioQueryService>();

  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<AudioQueryService> init() async {
    await _ensurePermissionGranted();
    return this;
  }

  Future<void> _ensurePermissionGranted() async {
    while (await _audioQuery.permissionsStatus() == false) {
      await _audioQuery.permissionsRequest();
    }
  }

  Future<List<up.Song>> querySongs() async {
    final List<SongModel> queryResult = await _audioQuery.querySongs();
    return queryResult
        .map((model) => model.toSong())
        .where((e) => e != null)
        .map((e) => e!)
        .toList();
  }

  Future<List<up.Album>> queryAlbums() async {
    final List<AlbumModel> queryResult = await _audioQuery.queryAlbums();
    return queryResult
        .map(
          (model) => model.toAlbum(),
        )
        .toList();
  }
}
