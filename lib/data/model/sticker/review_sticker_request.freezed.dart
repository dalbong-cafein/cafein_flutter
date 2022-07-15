// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_sticker_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewStickerRequest _$ReviewStickerRequestFromJson(Map<String, dynamic> json) {
  return _ReviewStickerRequest.fromJson(json);
}

/// @nodoc
mixin _$ReviewStickerRequest {
  int get reviewId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewStickerRequestCopyWith<ReviewStickerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStickerRequestCopyWith<$Res> {
  factory $ReviewStickerRequestCopyWith(ReviewStickerRequest value,
          $Res Function(ReviewStickerRequest) then) =
      _$ReviewStickerRequestCopyWithImpl<$Res>;
  $Res call({int reviewId});
}

/// @nodoc
class _$ReviewStickerRequestCopyWithImpl<$Res>
    implements $ReviewStickerRequestCopyWith<$Res> {
  _$ReviewStickerRequestCopyWithImpl(this._value, this._then);

  final ReviewStickerRequest _value;
  // ignore: unused_field
  final $Res Function(ReviewStickerRequest) _then;

  @override
  $Res call({
    Object? reviewId = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ReviewStickerRequestCopyWith<$Res>
    implements $ReviewStickerRequestCopyWith<$Res> {
  factory _$$_ReviewStickerRequestCopyWith(_$_ReviewStickerRequest value,
          $Res Function(_$_ReviewStickerRequest) then) =
      __$$_ReviewStickerRequestCopyWithImpl<$Res>;
  @override
  $Res call({int reviewId});
}

/// @nodoc
class __$$_ReviewStickerRequestCopyWithImpl<$Res>
    extends _$ReviewStickerRequestCopyWithImpl<$Res>
    implements _$$_ReviewStickerRequestCopyWith<$Res> {
  __$$_ReviewStickerRequestCopyWithImpl(_$_ReviewStickerRequest _value,
      $Res Function(_$_ReviewStickerRequest) _then)
      : super(_value, (v) => _then(v as _$_ReviewStickerRequest));

  @override
  _$_ReviewStickerRequest get _value => super._value as _$_ReviewStickerRequest;

  @override
  $Res call({
    Object? reviewId = freezed,
  }) {
    return _then(_$_ReviewStickerRequest(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewStickerRequest implements _ReviewStickerRequest {
  _$_ReviewStickerRequest({required this.reviewId});

  factory _$_ReviewStickerRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewStickerRequestFromJson(json);

  @override
  final int reviewId;

  @override
  String toString() {
    return 'ReviewStickerRequest(reviewId: $reviewId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewStickerRequest &&
            const DeepCollectionEquality().equals(other.reviewId, reviewId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reviewId));

  @JsonKey(ignore: true)
  @override
  _$$_ReviewStickerRequestCopyWith<_$_ReviewStickerRequest> get copyWith =>
      __$$_ReviewStickerRequestCopyWithImpl<_$_ReviewStickerRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewStickerRequestToJson(this);
  }
}

abstract class _ReviewStickerRequest implements ReviewStickerRequest {
  factory _ReviewStickerRequest({required final int reviewId}) =
      _$_ReviewStickerRequest;

  factory _ReviewStickerRequest.fromJson(Map<String, dynamic> json) =
      _$_ReviewStickerRequest.fromJson;

  @override
  int get reviewId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewStickerRequestCopyWith<_$_ReviewStickerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
