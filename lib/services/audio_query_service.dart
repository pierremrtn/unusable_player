import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:unusable_player/unusable_player.dart' as up;

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
        .retainMusics()
        .map((model) => model.toSong())
        .where((e) => e != null)
        .map((e) => e!)
        .toList();
  }

  Future<List<up.Song>> queryAlbumSongs(int albumID) async {
    final List<SongModel> queryResult = await _audioQuery.queryAudiosFrom(
      AudiosFromType.ALBUM_ID,
      albumID,
    );
    return queryResult
        .retainMusics()
        .map((model) => model.toSong())
        .where((e) => e != null)
        .map((e) => e!)
        .toList();
  }

  Future<List<up.Song>> queryArtistSongs(int artistID) async {
    final List<SongModel> queryResult = await _audioQuery.queryAudiosFrom(
      AudiosFromType.ARTIST_ID,
      artistID,
    );
    return queryResult
        .retainMusics()
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

  Future<List<up.Artist>> queryArtists() async {
    final List<ArtistModel> queryResult = await _audioQuery.queryArtists();
    return queryResult
        .map(
          (model) => model.toArtist(),
        )
        .toList();
  }
}

extension _ToSong on SongModel {
  up.Song? toSong() => uri != null
      ? up.Song(
          title: title,
          duration: Duration(milliseconds: duration ?? 0),
          uri: uri!,
          artist: up.ArtistRef(
            id: artistId,
            name: artist,
          ),
          album: up.AlbumRef(
            id: albumId,
            title: album,
          ),
        )
      : null;
}

extension _ToAlbum on AlbumModel {
  up.Album toAlbum() => up.Album(
        id: id,
        title: album,
        artist: up.ArtistRef(
          id: artistId,
          name: artist,
        ),
        songNumber: numOfSongs,
      );
}

extension _ToArtist on ArtistModel {
  up.Artist toArtist() => up.Artist(
        id: id,
        name: artist,
        numberOfTracks: numberOfTracks ?? 0,
      );
}

extension _Filter on List<SongModel> {
  Iterable<SongModel> retainMusics() => where(
        (element) => element.isMusic ?? false,
      );
}
