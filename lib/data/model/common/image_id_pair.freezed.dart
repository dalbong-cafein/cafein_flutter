// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_id_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageIdPair _$ImageIdPairFromJson(Map<String, dynamic> json) {
  return _StoreImagePair.fromJson(json);
}

/// @nodoc
mixin _$ImageIdPair {
  int get imageId => throw _privateConstructorUsedError;
  bool? get isGoogle => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool? get isCafein => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageIdPairCopyWith<ImageIdPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageIdPairCopyWith<$Res> {
  factory $ImageIdPairCopyWith(
          ImageIdPair value, $Res Function(ImageIdPair) then) =
      _$ImageIdPairCopyWithImpl<$Res>;
  $Res call({int imageId, bool? isGoogle, String imageUrl, bool? isCafein});
}

/// @nodoc
class _$ImageIdPairCopyWithImpl<$Res> implements $ImageIdPairCopyWith<$Res> {
  _$ImageIdPairCopyWithImpl(this._value, this._then);

  final ImageIdPair _value;
  // ignore: unused_field
  final $Res Function(ImageIdPair) _then;

  @override
  $Res call({
    Object? imageId = freezed,
    Object? isGoogle = freezed,
    Object? imageUrl = freezed,
    Object? isCafein = freezed,
  }) {
    return _then(_value.copyWith(
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      isGoogle: isGoogle == freezed
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isCafein: isCafein == freezed
          ? _value.isCafein
          : isCafein // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_StoreImagePairCopyWith<$Res>
    implements $ImageIdPairCopyWith<$Res> {
  factory _$$_StoreImagePairCopyWith(
          _$_StoreImagePair value, $Res Function(_$_StoreImagePair) then) =
      __$$_StoreImagePairCopyWithImpl<$Res>;
  @override
  $Res call({int imageId, bool? isGoogle, String imageUrl, bool? isCafein});
}

/// @nodoc
class __$$_StoreImagePairCopyWithImpl<$Res>
    extends _$ImageIdPairCopyWithImpl<$Res>
    implements _$$_StoreImagePairCopyWith<$Res> {
  __$$_StoreImagePairCopyWithImpl(
      _$_StoreImagePair _value, $Res Function(_$_StoreImagePair) _then)
      : super(_value, (v) => _then(v as _$_StoreImagePair));

  @override
  _$_StoreImagePair get _value => super._value as _$_StoreImagePair;

  @override
  $Res call({
    Object? imageId = freezed,
    Object? isGoogle = freezed,
    Object? imageUrl = freezed,
    Object? isCafein = freezed,
  }) {
    return _then(_$_StoreImagePair(
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      isGoogle: isGoogle == freezed
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isCafein: isCafein == freezed
          ? _value.isCafein
          : isCafein // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreImagePair implements _StoreImagePair {
  _$_StoreImagePair(
      {required this.imageId,
      this.isGoogle = false,
      required this.imageUrl,
      this.isCafein = false});

  factory _$_StoreImagePair.fromJson(Map<String, dynamic> json) =>
      _$$_StoreImagePairFromJson(json);

  @override
  final int imageId;
  @override
  @JsonKey()
  final bool? isGoogle;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final bool? isCafein;

  @override
  String toString() {
    return 'ImageIdPair(imageId: $imageId, isGoogle: $isGoogle, imageUrl: $imageUrl, isCafein: $isCafein)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreImagePair &&
            const DeepCollectionEquality().equals(other.imageId, imageId) &&
            const DeepCollectionEquality().equals(other.isGoogle, isGoogle) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.isCafein, isCafein));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageId),
      const DeepCollectionEquality().hash(isGoogle),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(isCafein));

  @JsonKey(ignore: true)
  @override
  _$$_StoreImagePairCopyWith<_$_StoreImagePair> get copyWith =>
      __$$_StoreImagePairCopyWithImpl<_$_StoreImagePair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreImagePairToJson(
      this,
    );
  }
}

abstract class _StoreImagePair implements ImageIdPair {
  factory _StoreImagePair(
      {required final int imageId,
      final bool? isGoogle,
      required final String imageUrl,
      final bool? isCafein}) = _$_StoreImagePair;

  factory _StoreImagePair.fromJson(Map<String, dynamic> json) =
      _$_StoreImagePair.fromJson;

  @override
  int get imageId;
  @override
  bool? get isGoogle;
  @override
  String get imageUrl;
  @override
  bool? get isCafein;
  @override
  @JsonKey(ignore: true)
  _$$_StoreImagePairCopyWith<_$_StoreImagePair> get copyWith =>
      throw _privateConstructorUsedError;
}
