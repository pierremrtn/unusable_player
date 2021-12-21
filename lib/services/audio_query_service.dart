import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:unusable_player/unusable_player.dart' as up;

class AudioQueryService extends GetxService {
  static AudioQueryService get instance => Get.find<AudioQueryService>();

  AudioQueryService({
    required this.colorService,
    required this.cacheService,
  });

  final OnAudioQuery _audioQuery = OnAudioQuery();
  final up.ColorService colorService;
  final up.CacheService cacheService;

  Future<AudioQueryService> init() async {
    await _ensurePermissionGranted();
    return this;
  }

  Future<void> _ensurePermissionGranted() async {
    while (await _audioQuery.permissionsStatus() == false) {
      await _audioQuery.permissionsRequest();
    }
  }

  Stream<up.Song> searchSong(String search) async* {
    final searchResult = await _audioQuery.queryWithFilters(
      search,
      WithFiltersType.AUDIOS,
    );
    yield* _convertToSongList(
      searchResult.map((e) => SongModel(e)),
    );
  }

  Stream<up.Song> querySongs() async* {
    yield* _convertToSongList(await _audioQuery.querySongs());
  }

  Stream<up.Song> queryAlbumSongs(int albumID) async* {
    yield* _convertToSongList(
      await _audioQuery.queryAudiosFrom(
        AudiosFromType.ALBUM_ID,
        albumID,
      ),
    );
  }

  Stream<up.Song> queryArtistSongs(int artistID) async* {
    yield* _convertToSongList(
      await _audioQuery.queryAudiosFrom(
        AudiosFromType.ARTIST_ID,
        artistID,
      ),
    );
  }

  Future<List<up.Album>> queryAlbums() async {
    final List<AlbumModel> queryResult = await _audioQuery.queryAlbums();
    return Stream.fromIterable(queryResult).asyncMap(
      (model) async {
        final rawImage = await _audioQuery.queryArtwork(
          model.id,
          ArtworkType.ALBUM,
        );
        up.Artwork? artwork;
        if (rawImage != null) {
          final image = MemoryImage(rawImage);

          Color? dominantColor =
              cacheService.cachedAlbumDominantColor(model.id);
          if (dominantColor == null) {
            dominantColor = await colorService.dominantColor(image);
            cacheService.cacheAlbumDominantColor(model.id, dominantColor);
            artwork = up.Artwork(image: image, dominantColor: dominantColor);
          }
        }
        return model.toAlbum(artwork: artwork);
      },
    ).toList();
  }

  Future<List<up.Artist>> queryArtists() async {
    final List<ArtistModel> queryResult = await _audioQuery.queryArtists();
    return queryResult
        .map(
          (model) => model.toArtist(),
        )
        .toList();
  }

  Stream<up.Song> _convertToSongList(
    Iterable<SongModel> songModels,
  ) async* {
    yield* Stream.fromIterable(songModels)
        .retainMusics()
        .asyncMap((model) async {
          final rawImage = await _audioQuery.queryArtwork(
            model.id,
            ArtworkType.AUDIO,
          );

          up.Artwork? artwork;
          if (rawImage != null) {
            final image = MemoryImage(rawImage);

            Color? dominantColor =
                cacheService.cachedSongDominantColor(model.id);
            if (dominantColor == null) {
              dominantColor = await colorService.dominantColor(image);
              cacheService.cacheSongDominantColor(model.id, dominantColor);
            }

            artwork = up.Artwork(image: image, dominantColor: dominantColor);
          }

          return model.toSong(artwork: artwork);
        })
        .where((e) => e != null)
        .map((e) => e!);
  }
}

extension _ToSong on SongModel {
  up.Song? toSong({required up.Artwork? artwork}) => uri != null
      ? up.Song(
          id: id,
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
  up.Album toAlbum({required up.Artwork? artwork}) => up.Album(
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
