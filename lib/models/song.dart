import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

@freezed
class Song with _$Song {
  const Song._();

  const factory Song({
    required String title,
    required String uri,
    required Duration duration,
    String? artist,
    String? album,
  }) = _Song;  
}
