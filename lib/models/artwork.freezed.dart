// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artwork.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ArtworkTearOff {
  const _$ArtworkTearOff();

  _Artwork call(
      {required ImageProvider<Object> image, required Color dominantColor}) {
    return _Artwork(
      image: image,
      dominantColor: dominantColor,
    );
  }
}

/// @nodoc
const $Artwork = _$ArtworkTearOff();

/// @nodoc
mixin _$Artwork {
  ImageProvider<Object> get image => throw _privateConstructorUsedError;
  Color get dominantColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtworkCopyWith<Artwork> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCopyWith<$Res> {
  factory $ArtworkCopyWith(Artwork value, $Res Function(Artwork) then) =
      _$ArtworkCopyWithImpl<$Res>;
  $Res call({ImageProvider<Object> image, Color dominantColor});
}

/// @nodoc
class _$ArtworkCopyWithImpl<$Res> implements $ArtworkCopyWith<$Res> {
  _$ArtworkCopyWithImpl(this._value, this._then);

  final Artwork _value;
  // ignore: unused_field
  final $Res Function(Artwork) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? dominantColor = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>,
      dominantColor: dominantColor == freezed
          ? _value.dominantColor
          : dominantColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
abstract class _$ArtworkCopyWith<$Res> implements $ArtworkCopyWith<$Res> {
  factory _$ArtworkCopyWith(_Artwork value, $Res Function(_Artwork) then) =
      __$ArtworkCopyWithImpl<$Res>;
  @override
  $Res call({ImageProvider<Object> image, Color dominantColor});
}

/// @nodoc
class __$ArtworkCopyWithImpl<$Res> extends _$ArtworkCopyWithImpl<$Res>
    implements _$ArtworkCopyWith<$Res> {
  __$ArtworkCopyWithImpl(_Artwork _value, $Res Function(_Artwork) _then)
      : super(_value, (v) => _then(v as _Artwork));

  @override
  _Artwork get _value => super._value as _Artwork;

  @override
  $Res call({
    Object? image = freezed,
    Object? dominantColor = freezed,
  }) {
    return _then(_Artwork(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>,
      dominantColor: dominantColor == freezed
          ? _value.dominantColor
          : dominantColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_Artwork extends _Artwork {
  const _$_Artwork({required this.image, required this.dominantColor})
      : super._();

  @override
  final ImageProvider<Object> image;
  @override
  final Color dominantColor;

  @override
  String toString() {
    return 'Artwork(image: $image, dominantColor: $dominantColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Artwork &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.dominantColor, dominantColor) ||
                const DeepCollectionEquality()
                    .equals(other.dominantColor, dominantColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(dominantColor);

  @JsonKey(ignore: true)
  @override
  _$ArtworkCopyWith<_Artwork> get copyWith =>
      __$ArtworkCopyWithImpl<_Artwork>(this, _$identity);
}

abstract class _Artwork extends Artwork {
  const factory _Artwork(
      {required ImageProvider<Object> image,
      required Color dominantColor}) = _$_Artwork;
  const _Artwork._() : super._();

  @override
  ImageProvider<Object> get image => throw _privateConstructorUsedError;
  @override
  Color get dominantColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArtworkCopyWith<_Artwork> get copyWith =>
      throw _privateConstructorUsedError;
}
