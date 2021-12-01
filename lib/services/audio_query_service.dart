import 'dart:typed_data';
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

  Future<List<up.Song>> searchSong(String search) async {
    final searchResult = await _audioQuery.queryWithFilters(
      search,
      WithFiltersType.AUDIOS,
    );
    return _convertToSongList(
      searchResult.map((e) => SongModel(e)),
    );
  }

  Future<List<up.Song>> querySongs() async {
    return _convertToSongList(await _audioQuery.querySongs());
  }

  Future<List<up.Song>> queryAlbumSongs(int albumID) async {
    return _convertToSongList(
      await _audioQuery.queryAudiosFrom(
        AudiosFromType.ALBUM_ID,
        albumID,
      ),
    );
  }

  Future<List<up.Song>> queryArtistSongs(int artistID) async {
    return _convertToSongList(
      await _audioQuery.queryAudiosFrom(
        AudiosFromType.ARTIST_ID,
        artistID,
      ),
    );
  }

  Future<List<up.Album>> queryAlbums() async {
    final List<AlbumModel> queryResult = await _audioQuery.queryAlbums();
    return Stream.fromIterable(queryResult)
        .asyncMap(
          (model) async => model.toAlbum(
            artwork: await _audioQuery.queryArtwork(
              model.id,
              ArtworkType.ALBUM,
            ),
          ),
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

  Future<List<up.Song>> _convertToSongList(
    Iterable<SongModel> songModels,
  ) async {
    return Stream.fromIterable(songModels)
        .retainMusics()
        .asyncMap(
          (model) async => model.toSong(
            artwork: await _audioQuery.queryArtwork(
              model.id,
              ArtworkType.AUDIO,
            ),
          ),
        )
        .where((e) => e != null)
        .map((e) => e!)
        .toList();
  }
}

extension _ToSong on SongModel {
  up.Song? toSong({required Uint8List? artwork}) => uri != null
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
          artwork: artwork,
        )
      : null;
}

extension _ToAlbum on AlbumModel {
  up.Album toAlbum({required Uint8List? artwork}) => up.Album(
        id: id,
        title: album,
        artist: up.ArtistRef(
          id: artistId,
          name: artist,
        ),
        songNumber: numOfSongs,
        artwork: artwork,
      );
}

extension _ToArtist on ArtistModel {
  up.Artist toArtist() => up.Artist(
        id: id,
        name: artist,
        numberOfTracks: numberOfTracks ?? 0,
      );
}

extension _FilterSongs on Stream<SongModel> {
  Stream<SongModel> retainMusics() => where(
        (element) => element.isMusic ?? false,
      );
}
