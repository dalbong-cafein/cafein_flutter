// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  int get reviewId => throw _privateConstructorUsedError;
  int get writerId => throw _privateConstructorUsedError;
  String get nickNameOfWriter => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  int get visitCnt => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get imageIdPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res>;
  $Res call(
      {int reviewId,
      int writerId,
      String nickNameOfWriter,
      String? profileImageUrl,
      int visitCnt,
      String content,
      @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  final Review _value;
  // ignore: unused_field
  final $Res Function(Review) _then;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? writerId = freezed,
    Object? nickNameOfWriter = freezed,
    Object? profileImageUrl = freezed,
    Object? visitCnt = freezed,
    Object? content = freezed,
    Object? imageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      writerId: writerId == freezed
          ? _value.writerId
          : writerId // ignore: cast_nullable_to_non_nullable
              as int,
      nickNameOfWriter: nickNameOfWriter == freezed
          ? _value.nickNameOfWriter
          : nickNameOfWriter // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCnt: visitCnt == freezed
          ? _value.visitCnt
          : visitCnt // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageIdPairs: imageIdPairs == freezed
          ? _value.imageIdPairs
          : imageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$_ReviewCopyWith(_$_Review value, $Res Function(_$_Review) then) =
      __$$_ReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {int reviewId,
      int writerId,
      String nickNameOfWriter,
      String? profileImageUrl,
      int visitCnt,
      String content,
      @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class __$$_ReviewCopyWithImpl<$Res> extends _$ReviewCopyWithImpl<$Res>
    implements _$$_ReviewCopyWith<$Res> {
  __$$_ReviewCopyWithImpl(_$_Review _value, $Res Function(_$_Review) _then)
      : super(_value, (v) => _then(v as _$_Review));

  @override
  _$_Review get _value => super._value as _$_Review;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? writerId = freezed,
    Object? nickNameOfWriter = freezed,
    Object? profileImageUrl = freezed,
    Object? visitCnt = freezed,
    Object? content = freezed,
    Object? imageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_Review(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      writerId: writerId == freezed
          ? _value.writerId
          : writerId // ignore: cast_nullable_to_non_nullable
              as int,
      nickNameOfWriter: nickNameOfWriter == freezed
          ? _value.nickNameOfWriter
          : nickNameOfWriter // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCnt: visitCnt == freezed
          ? _value.visitCnt
          : visitCnt // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageIdPairs: imageIdPairs == freezed
          ? _value._imageIdPairs
          : imageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Review implements _Review {
  _$_Review(
      {required this.reviewId,
      required this.writerId,
      required this.nickNameOfWriter,
      this.profileImageUrl,
      required this.visitCnt,
      required this.content,
      @JsonKey(name: 'reviewImageDtoList')
          final List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime')
          required this.registeredDateTime})
      : _imageIdPairs = imageIdPairs;

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  final int reviewId;
  @override
  final int writerId;
  @override
  final String nickNameOfWriter;
  @override
  final String? profileImageUrl;
  @override
  final int visitCnt;
  @override
  final String content;
  final List<ImageIdPair>? _imageIdPairs;
  @override
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get imageIdPairs {
    final value = _imageIdPairs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'Review(reviewId: $reviewId, writerId: $writerId, nickNameOfWriter: $nickNameOfWriter, profileImageUrl: $profileImageUrl, visitCnt: $visitCnt, content: $content, imageIdPairs: $imageIdPairs, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Review &&
            const DeepCollectionEquality().equals(other.reviewId, reviewId) &&
            const DeepCollectionEquality().equals(other.writerId, writerId) &&
            const DeepCollectionEquality()
                .equals(other.nickNameOfWriter, nickNameOfWriter) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality().equals(other.visitCnt, visitCnt) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other._imageIdPairs, _imageIdPairs) &&
            const DeepCollectionEquality()
                .equals(other.registeredDateTime, registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reviewId),
      const DeepCollectionEquality().hash(writerId),
      const DeepCollectionEquality().hash(nickNameOfWriter),
      const DeepCollectionEquality().hash(profileImageUrl),
      const DeepCollectionEquality().hash(visitCnt),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(_imageIdPairs),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      __$$_ReviewCopyWithImpl<_$_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(this);
  }
}

abstract class _Review implements Review {
  factory _Review(
      {required final int reviewId,
      required final int writerId,
      required final String nickNameOfWriter,
      final String? profileImageUrl,
      required final int visitCnt,
      required final String content,
      @JsonKey(name: 'reviewImageDtoList')
          final List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_Review;

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  int get reviewId => throw _privateConstructorUsedError;
  @override
  int get writerId => throw _privateConstructorUsedError;
  @override
  String get nickNameOfWriter => throw _privateConstructorUsedError;
  @override
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @override
  int get visitCnt => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get imageIdPairs => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      throw _privateConstructorUsedError;
}
