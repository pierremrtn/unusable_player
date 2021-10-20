import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';

const kFallbackArtistName = "Unknown";

@freezed
class Artist with _$Artist {
  const Artist._();

  const factory Artist({
    required int id,
    @Default(kFallbackArtistName) String name,
  }) = _Artist;
}

class ArtistRef {
  const ArtistRef({
    this.id,
    String? name,
  }) : name = name ?? kFallbackArtistName;

  final int? id;
  final String name;

  bool get isValid => id != null;
}
