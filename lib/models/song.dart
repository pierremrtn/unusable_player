import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'artist.dart';
import 'album.dart';
import 'artwork.dart';

part 'song.freezed.dart';

@freezed
class Song with _$Song {
  const Song._();

  const factory Song({
    required int id,
    required String title,
    required String uri,
    required Duration duration,
    required ArtistRef artist,
    required AlbumRef album,
    Artwork? artwork,
  }) = _Song;
}
