// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlbumTearOff {
  const _$AlbumTearOff();

  _Album call(
      {required int id,
      String title = kFallbackAlbumTitle,
      required ArtistRef artist,
      required int songNumber,
      Uint8List? artwork}) {
    return _Album(
      id: id,
      title: title,
      artist: artist,
      songNumber: songNumber,
      artwork: artwork,
    );
  }
}

/// @nodoc
const $Album = _$AlbumTearOff();

/// @nodoc
mixin _$Album {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ArtistRef get artist => throw _privateConstructorUsedError;
  int get songNumber => throw _privateConstructorUsedError;
  Uint8List? get artwork => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      ArtistRef artist,
      int songNumber,
      Uint8List? artwork});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res> implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  final Album _value;
  // ignore: unused_field
  final $Res Function(Album) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artist = freezed,
    Object? songNumber = freezed,
    Object? artwork = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistRef,
      songNumber: songNumber == freezed
          ? _value.songNumber
          : songNumber // ignore: cast_nullable_to_non_nullable
              as int,
      artwork: artwork == freezed
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
abstract class _$AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$AlbumCopyWith(_Album value, $Res Function(_Album) then) =
      __$AlbumCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      ArtistRef artist,
      int songNumber,
      Uint8List? artwork});
}

/// @nodoc
class __$AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res>
    implements _$AlbumCopyWith<$Res> {
  __$AlbumCopyWithImpl(_Album _value, $Res Function(_Album) _then)
      : super(_value, (v) => _then(v as _Album));

  @override
  _Album get _value => super._value as _Album;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artist = freezed,
    Object? songNumber = freezed,
    Object? artwork = freezed,
  }) {
    return _then(_Album(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistRef,
      songNumber: songNumber == freezed
          ? _value.songNumber
          : songNumber // ignore: cast_nullable_to_non_nullable
              as int,
      artwork: artwork == freezed
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_Album extends _Album {
  const _$_Album(
      {required this.id,
      this.title = kFallbackAlbumTitle,
      required this.artist,
      required this.songNumber,
      this.artwork})
      : super._();

  @override
  final int id;
  @JsonKey(defaultValue: kFallbackAlbumTitle)
  @override
  final String title;
  @override
  final ArtistRef artist;
  @override
  final int songNumber;
  @override
  final Uint8List? artwork;

  @override
  String toString() {
    return 'Album(id: $id, title: $title, artist: $artist, songNumber: $songNumber, artwork: $artwork)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Album &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.artist, artist) ||
                const DeepCollectionEquality().equals(other.artist, artist)) &&
            (identical(other.songNumber, songNumber) ||
                const DeepCollectionEquality()
                    .equals(other.songNumber, songNumber)) &&
            (identical(other.artwork, artwork) ||
                const DeepCollectionEquality().equals(other.artwork, artwork)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(artist) ^
      const DeepCollectionEquality().hash(songNumber) ^
      const DeepCollectionEquality().hash(artwork);

  @JsonKey(ignore: true)
  @override
  _$AlbumCopyWith<_Album> get copyWith =>
      __$AlbumCopyWithImpl<_Album>(this, _$identity);
}

abstract class _Album extends Album {
  const factory _Album(
      {required int id,
      String title,
      required ArtistRef artist,
      required int songNumber,
      Uint8List? artwork}) = _$_Album;
  const _Album._() : super._();

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  ArtistRef get artist => throw _privateConstructorUsedError;
  @override
  int get songNumber => throw _privateConstructorUsedError;
  @override
  Uint8List? get artwork => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlbumCopyWith<_Album> get copyWith => throw _privateConstructorUsedError;
}
