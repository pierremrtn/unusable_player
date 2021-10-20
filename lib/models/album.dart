import 'package:freezed_annotation/freezed_annotation.dart';
import 'artist.dart';

part 'album.freezed.dart';

const kFallbackAlbumTitle = "Untiteled";

@freezed
class Album with _$Album {
  const Album._();

  const factory Album({
    required int id,
    @Default(kFallbackAlbumTitle) String title,
    required ArtistRef artist,
    required int songNumber,
  }) = _Album;
}

class AlbumRef {
  const AlbumRef({
    this.id,
    String? title,
  }) : title = title ?? kFallbackAlbumTitle;

  final int? id;
  final String title;

  bool get isValid => id != null;
}
