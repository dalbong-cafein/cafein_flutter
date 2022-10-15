// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_type_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageTypePair {
  String get imageUrl => throw _privateConstructorUsedError;
  ImageType get imageType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageTypePairCopyWith<ImageTypePair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTypePairCopyWith<$Res> {
  factory $ImageTypePairCopyWith(
          ImageTypePair value, $Res Function(ImageTypePair) then) =
      _$ImageTypePairCopyWithImpl<$Res, ImageTypePair>;
  @useResult
  $Res call({String imageUrl, ImageType imageType});
}

/// @nodoc
class _$ImageTypePairCopyWithImpl<$Res, $Val extends ImageTypePair>
    implements $ImageTypePairCopyWith<$Res> {
  _$ImageTypePairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? imageType = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: null == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as ImageType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageTypePairCopyWith<$Res>
    implements $ImageTypePairCopyWith<$Res> {
  factory _$$_ImageTypePairCopyWith(
          _$_ImageTypePair value, $Res Function(_$_ImageTypePair) then) =
      __$$_ImageTypePairCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, ImageType imageType});
}

/// @nodoc
class __$$_ImageTypePairCopyWithImpl<$Res>
    extends _$ImageTypePairCopyWithImpl<$Res, _$_ImageTypePair>
    implements _$$_ImageTypePairCopyWith<$Res> {
  __$$_ImageTypePairCopyWithImpl(
      _$_ImageTypePair _value, $Res Function(_$_ImageTypePair) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? imageType = null,
  }) {
    return _then(_$_ImageTypePair(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: null == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as ImageType,
    ));
  }
}

/// @nodoc

class _$_ImageTypePair implements _ImageTypePair {
  _$_ImageTypePair({required this.imageUrl, required this.imageType});

  @override
  final String imageUrl;
  @override
  final ImageType imageType;

  @override
  String toString() {
    return 'ImageTypePair(imageUrl: $imageUrl, imageType: $imageType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageTypePair &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageType, imageType) ||
                other.imageType == imageType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, imageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageTypePairCopyWith<_$_ImageTypePair> get copyWith =>
      __$$_ImageTypePairCopyWithImpl<_$_ImageTypePair>(this, _$identity);
}

abstract class _ImageTypePair implements ImageTypePair {
  factory _ImageTypePair(
      {required final String imageUrl,
      required final ImageType imageType}) = _$_ImageTypePair;

  @override
  String get imageUrl;
  @override
  ImageType get imageType;
  @override
  @JsonKey(ignore: true)
  _$$_ImageTypePairCopyWith<_$_ImageTypePair> get copyWith =>
      throw _privateConstructorUsedError;
}
