// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ArtistTearOff {
  const _$ArtistTearOff();

  _Artist call(
      {required int id,
      String name = kFallbackArtistName,
      required int numberOfTracks}) {
    return _Artist(
      id: id,
      name: name,
      numberOfTracks: numberOfTracks,
    );
  }
}

/// @nodoc
const $Artist = _$ArtistTearOff();

/// @nodoc
mixin _$Artist {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get numberOfTracks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res>;
  $Res call({int id, String name, int numberOfTracks});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res> implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  final Artist _value;
  // ignore: unused_field
  final $Res Function(Artist) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? numberOfTracks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfTracks: numberOfTracks == freezed
          ? _value.numberOfTracks
          : numberOfTracks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$ArtistCopyWith(_Artist value, $Res Function(_Artist) then) =
      __$ArtistCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int numberOfTracks});
}

/// @nodoc
class __$ArtistCopyWithImpl<$Res> extends _$ArtistCopyWithImpl<$Res>
    implements _$ArtistCopyWith<$Res> {
  __$ArtistCopyWithImpl(_Artist _value, $Res Function(_Artist) _then)
      : super(_value, (v) => _then(v as _Artist));

  @override
  _Artist get _value => super._value as _Artist;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? numberOfTracks = freezed,
  }) {
    return _then(_Artist(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfTracks: numberOfTracks == freezed
          ? _value.numberOfTracks
          : numberOfTracks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Artist extends _Artist {
  const _$_Artist(
      {required this.id,
      this.name = kFallbackArtistName,
      required this.numberOfTracks})
      : super._();

  @override
  final int id;
  @JsonKey(defaultValue: kFallbackArtistName)
  @override
  final String name;
  @override
  final int numberOfTracks;

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, numberOfTracks: $numberOfTracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Artist &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.numberOfTracks, numberOfTracks) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfTracks, numberOfTracks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(numberOfTracks);

  @JsonKey(ignore: true)
  @override
  _$ArtistCopyWith<_Artist> get copyWith =>
      __$ArtistCopyWithImpl<_Artist>(this, _$identity);
}

abstract class _Artist extends Artist {
  const factory _Artist(
      {required int id, String name, required int numberOfTracks}) = _$_Artist;
  const _Artist._() : super._();

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get numberOfTracks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArtistCopyWith<_Artist> get copyWith => throw _privateConstructorUsedError;
}
