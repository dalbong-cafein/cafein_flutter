// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreReview _$StoreReviewFromJson(Map<String, dynamic> json) {
  return _StoreReview.fromJson(json);
}

/// @nodoc
mixin _$StoreReview {
  int get reviewId => throw _privateConstructorUsedError;
  int get writerId => throw _privateConstructorUsedError;
  String get nicknameOfWriter => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get visitCnt => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  DetailEvaluation get detailEvaluation => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get imageIdPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreReviewCopyWith<StoreReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreReviewCopyWith<$Res> {
  factory $StoreReviewCopyWith(
          StoreReview value, $Res Function(StoreReview) then) =
      _$StoreReviewCopyWithImpl<$Res>;
  $Res call(
      {int reviewId,
      int writerId,
      String nicknameOfWriter,
      String? profileImageUrl,
      String content,
      int visitCnt,
      String recommendation,
      DetailEvaluation detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  $DetailEvaluationCopyWith<$Res> get detailEvaluation;
}

/// @nodoc
class _$StoreReviewCopyWithImpl<$Res> implements $StoreReviewCopyWith<$Res> {
  _$StoreReviewCopyWithImpl(this._value, this._then);

  final StoreReview _value;
  // ignore: unused_field
  final $Res Function(StoreReview) _then;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? writerId = freezed,
    Object? nicknameOfWriter = freezed,
    Object? profileImageUrl = freezed,
    Object? content = freezed,
    Object? visitCnt = freezed,
    Object? recommendation = freezed,
    Object? detailEvaluation = freezed,
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
      nicknameOfWriter: nicknameOfWriter == freezed
          ? _value.nicknameOfWriter
          : nicknameOfWriter // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      visitCnt: visitCnt == freezed
          ? _value.visitCnt
          : visitCnt // ignore: cast_nullable_to_non_nullable
              as int,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      detailEvaluation: detailEvaluation == freezed
          ? _value.detailEvaluation
          : detailEvaluation // ignore: cast_nullable_to_non_nullable
              as DetailEvaluation,
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

  @override
  $DetailEvaluationCopyWith<$Res> get detailEvaluation {
    return $DetailEvaluationCopyWith<$Res>(_value.detailEvaluation, (value) {
      return _then(_value.copyWith(detailEvaluation: value));
    });
  }
}

/// @nodoc
abstract class _$$_StoreReviewCopyWith<$Res>
    implements $StoreReviewCopyWith<$Res> {
  factory _$$_StoreReviewCopyWith(
          _$_StoreReview value, $Res Function(_$_StoreReview) then) =
      __$$_StoreReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {int reviewId,
      int writerId,
      String nicknameOfWriter,
      String? profileImageUrl,
      String content,
      int visitCnt,
      String recommendation,
      DetailEvaluation detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  @override
  $DetailEvaluationCopyWith<$Res> get detailEvaluation;
}

/// @nodoc
class __$$_StoreReviewCopyWithImpl<$Res> extends _$StoreReviewCopyWithImpl<$Res>
    implements _$$_StoreReviewCopyWith<$Res> {
  __$$_StoreReviewCopyWithImpl(
      _$_StoreReview _value, $Res Function(_$_StoreReview) _then)
      : super(_value, (v) => _then(v as _$_StoreReview));

  @override
  _$_StoreReview get _value => super._value as _$_StoreReview;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? writerId = freezed,
    Object? nicknameOfWriter = freezed,
    Object? profileImageUrl = freezed,
    Object? content = freezed,
    Object? visitCnt = freezed,
    Object? recommendation = freezed,
    Object? detailEvaluation = freezed,
    Object? imageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_StoreReview(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      writerId: writerId == freezed
          ? _value.writerId
          : writerId // ignore: cast_nullable_to_non_nullable
              as int,
      nicknameOfWriter: nicknameOfWriter == freezed
          ? _value.nicknameOfWriter
          : nicknameOfWriter // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      visitCnt: visitCnt == freezed
          ? _value.visitCnt
          : visitCnt // ignore: cast_nullable_to_non_nullable
              as int,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      detailEvaluation: detailEvaluation == freezed
          ? _value.detailEvaluation
          : detailEvaluation // ignore: cast_nullable_to_non_nullable
              as DetailEvaluation,
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
class _$_StoreReview implements _StoreReview {
  _$_StoreReview(
      {required this.reviewId,
      required this.writerId,
      required this.nicknameOfWriter,
      this.profileImageUrl,
      required this.content,
      required this.visitCnt,
      required this.recommendation,
      required this.detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList')
          final List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime')
          required this.registeredDateTime})
      : _imageIdPairs = imageIdPairs;

  factory _$_StoreReview.fromJson(Map<String, dynamic> json) =>
      _$$_StoreReviewFromJson(json);

  @override
  final int reviewId;
  @override
  final int writerId;
  @override
  final String nicknameOfWriter;
  @override
  final String? profileImageUrl;
  @override
  final String content;
  @override
  final int visitCnt;
  @override
  final String recommendation;
  @override
  final DetailEvaluation detailEvaluation;
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
    return 'StoreReview(reviewId: $reviewId, writerId: $writerId, nicknameOfWriter: $nicknameOfWriter, profileImageUrl: $profileImageUrl, content: $content, visitCnt: $visitCnt, recommendation: $recommendation, detailEvaluation: $detailEvaluation, imageIdPairs: $imageIdPairs, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreReview &&
            const DeepCollectionEquality().equals(other.reviewId, reviewId) &&
            const DeepCollectionEquality().equals(other.writerId, writerId) &&
            const DeepCollectionEquality()
                .equals(other.nicknameOfWriter, nicknameOfWriter) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.visitCnt, visitCnt) &&
            const DeepCollectionEquality()
                .equals(other.recommendation, recommendation) &&
            const DeepCollectionEquality()
                .equals(other.detailEvaluation, detailEvaluation) &&
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
      const DeepCollectionEquality().hash(nicknameOfWriter),
      const DeepCollectionEquality().hash(profileImageUrl),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(visitCnt),
      const DeepCollectionEquality().hash(recommendation),
      const DeepCollectionEquality().hash(detailEvaluation),
      const DeepCollectionEquality().hash(_imageIdPairs),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_StoreReviewCopyWith<_$_StoreReview> get copyWith =>
      __$$_StoreReviewCopyWithImpl<_$_StoreReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreReviewToJson(this);
  }
}

abstract class _StoreReview implements StoreReview {
  factory _StoreReview(
      {required final int reviewId,
      required final int writerId,
      required final String nicknameOfWriter,
      final String? profileImageUrl,
      required final String content,
      required final int visitCnt,
      required final String recommendation,
      required final DetailEvaluation detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList')
          final List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_StoreReview;

  factory _StoreReview.fromJson(Map<String, dynamic> json) =
      _$_StoreReview.fromJson;

  @override
  int get reviewId => throw _privateConstructorUsedError;
  @override
  int get writerId => throw _privateConstructorUsedError;
  @override
  String get nicknameOfWriter => throw _privateConstructorUsedError;
  @override
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  int get visitCnt => throw _privateConstructorUsedError;
  @override
  String get recommendation => throw _privateConstructorUsedError;
  @override
  DetailEvaluation get detailEvaluation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get imageIdPairs => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreReviewCopyWith<_$_StoreReview> get copyWith =>
      throw _privateConstructorUsedError;
}
