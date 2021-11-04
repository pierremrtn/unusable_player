// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerStateTearOff {
  const _$PlayerStateTearOff();

  _PlayerState call(
      {Song? displayedSong,
      bool displayPlayingSong = false,
      bool isPlaying = false}) {
    return _PlayerState(
      displayedSong: displayedSong,
      displayPlayingSong: displayPlayingSong,
      isPlaying: isPlaying,
    );
  }
}

/// @nodoc
const $PlayerState = _$PlayerStateTearOff();

/// @nodoc
mixin _$PlayerState {
  Song? get displayedSong => throw _privateConstructorUsedError;
  bool get displayPlayingSong => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res>;
  $Res call({Song? displayedSong, bool displayPlayingSong, bool isPlaying});

  $SongCopyWith<$Res>? get displayedSong;
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res> implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  final PlayerState _value;
  // ignore: unused_field
  final $Res Function(PlayerState) _then;

  @override
  $Res call({
    Object? displayedSong = freezed,
    Object? displayPlayingSong = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_value.copyWith(
      displayedSong: displayedSong == freezed
          ? _value.displayedSong
          : displayedSong // ignore: cast_nullable_to_non_nullable
              as Song?,
      displayPlayingSong: displayPlayingSong == freezed
          ? _value.displayPlayingSong
          : displayPlayingSong // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $SongCopyWith<$Res>? get displayedSong {
    if (_value.displayedSong == null) {
      return null;
    }

    return $SongCopyWith<$Res>(_value.displayedSong!, (value) {
      return _then(_value.copyWith(displayedSong: value));
    });
  }
}

/// @nodoc
abstract class _$PlayerStateCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$PlayerStateCopyWith(
          _PlayerState value, $Res Function(_PlayerState) then) =
      __$PlayerStateCopyWithImpl<$Res>;
  @override
  $Res call({Song? displayedSong, bool displayPlayingSong, bool isPlaying});

  @override
  $SongCopyWith<$Res>? get displayedSong;
}

/// @nodoc
class __$PlayerStateCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$PlayerStateCopyWith<$Res> {
  __$PlayerStateCopyWithImpl(
      _PlayerState _value, $Res Function(_PlayerState) _then)
      : super(_value, (v) => _then(v as _PlayerState));

  @override
  _PlayerState get _value => super._value as _PlayerState;

  @override
  $Res call({
    Object? displayedSong = freezed,
    Object? displayPlayingSong = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_PlayerState(
      displayedSong: displayedSong == freezed
          ? _value.displayedSong
          : displayedSong // ignore: cast_nullable_to_non_nullable
              as Song?,
      displayPlayingSong: displayPlayingSong == freezed
          ? _value.displayPlayingSong
          : displayPlayingSong // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlayerState extends _PlayerState {
  const _$_PlayerState(
      {this.displayedSong,
      this.displayPlayingSong = false,
      this.isPlaying = false})
      : super._();

  @override
  final Song? displayedSong;
  @JsonKey(defaultValue: false)
  @override
  final bool displayPlayingSong;
  @JsonKey(defaultValue: false)
  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'PlayerState(displayedSong: $displayedSong, displayPlayingSong: $displayPlayingSong, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayerState &&
            (identical(other.displayedSong, displayedSong) ||
                const DeepCollectionEquality()
                    .equals(other.displayedSong, displayedSong)) &&
            (identical(other.displayPlayingSong, displayPlayingSong) ||
                const DeepCollectionEquality()
                    .equals(other.displayPlayingSong, displayPlayingSong)) &&
            (identical(other.isPlaying, isPlaying) ||
                const DeepCollectionEquality()
                    .equals(other.isPlaying, isPlaying)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(displayedSong) ^
      const DeepCollectionEquality().hash(displayPlayingSong) ^
      const DeepCollectionEquality().hash(isPlaying);

  @JsonKey(ignore: true)
  @override
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);
}

abstract class _PlayerState extends PlayerState {
  const factory _PlayerState(
      {Song? displayedSong,
      bool displayPlayingSong,
      bool isPlaying}) = _$_PlayerState;
  const _PlayerState._() : super._();

  @override
  Song? get displayedSong => throw _privateConstructorUsedError;
  @override
  bool get displayPlayingSong => throw _privateConstructorUsedError;
  @override
  bool get isPlaying => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
