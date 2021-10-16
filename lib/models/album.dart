import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';

@freezed
class Album with _$Album {
  const Album._();

  const factory Album({
    required String title,
    required String artist,
    required int songNumber,
  }) = _Album;
}
