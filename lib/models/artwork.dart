import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork.freezed.dart';

@freezed
class Artwork with _$Artwork {
  const Artwork._();

  const factory Artwork({
    required ImageProvider image,
    required Color dominantColor,
  }) = _Artwork;
}
