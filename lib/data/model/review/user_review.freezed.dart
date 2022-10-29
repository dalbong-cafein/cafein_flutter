// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserReview _$UserReviewFromJson(Map<String, dynamic> json) {
  return _UserReview.fromJson(json);
}

/// @nodoc
mixin _$UserReview {
  int get reviewId => throw _privateConstructorUsedError;
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int get visitCnt => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  DetailEvaluation get detailEvaluation => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewImageDto')
  List<ImageIdPair>? get reviewImageIdPairs =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImage')
  ImageIdPair? get storeImageIdPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReviewCopyWith<UserReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReviewCopyWith<$Res> {
  factory $UserReviewCopyWith(
          UserReview value, $Res Function(UserReview) then) =
      _$UserReviewCopyWithImpl<$Res, UserReview>;
  @useResult
  $Res call(
      {int reviewId,
      int storeId,
      String storeName,
      String? content,
      int visitCnt,
      String recommendation,
      DetailEvaluation detailEvaluation,
      @JsonKey(name: 'reviewImageDto') List<ImageIdPair>? reviewImageIdPairs,
      @JsonKey(name: 'storeImage') ImageIdPair? storeImageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  $DetailEvaluationCopyWith<$Res> get detailEvaluation;
  $ImageIdPairCopyWith<$Res>? get storeImageIdPairs;
}

/// @nodoc
class _$UserReviewCopyWithImpl<$Res, $Val extends UserReview>
    implements $UserReviewCopyWith<$Res> {
  _$UserReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? storeId = null,
    Object? storeName = null,
    Object? content = freezed,
    Object? visitCnt = null,
    Object? recommendation = null,
    Object? detailEvaluation = null,
    Object? reviewImageIdPairs = freezed,
    Object? storeImageIdPairs = freezed,
    Object? registeredDateTime = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCnt: null == visitCnt
          ? _value.visitCnt
          : visitCnt // ignore: cast_nullable_to_non_nullable
              as int,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      detailEvaluation: null == detailEvaluation
          ? _value.detailEvaluation
          : detailEvaluation // ignore: cast_nullable_to_non_nullable
              as DetailEvaluation,
      reviewImageIdPairs: freezed == reviewImageIdPairs
          ? _value.reviewImageIdPairs
          : reviewImageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      storeImageIdPairs: freezed == storeImageIdPairs
          ? _value.storeImageIdPairs
          : storeImageIdPairs // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailEvaluationCopyWith<$Res> get detailEvaluation {
    return $DetailEvaluationCopyWith<$Res>(_value.detailEvaluation, (value) {
      return _then(_value.copyWith(detailEvaluation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageIdPairCopyWith<$Res>? get storeImageIdPairs {
    if (_value.storeImageIdPairs == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.storeImageIdPairs!, (value) {
      return _then(_value.copyWith(storeImageIdPairs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserReviewCopyWith<$Res>
    implements $UserReviewCopyWith<$Res> {
  factory _$$_UserReviewCopyWith(
          _$_UserReview value, $Res Function(_$_UserReview) then) =
      __$$_UserReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int reviewId,
      int storeId,
      String storeName,
      String? content,
      int visitCnt,
      String recommendation,
      DetailEvaluation detailEvaluation,
      @JsonKey(name: 'reviewImageDto') List<ImageIdPair>? reviewImageIdPairs,
      @JsonKey(name: 'storeImage') ImageIdPair? storeImageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  @override
  $DetailEvaluationCopyWith<$Res> get detailEvaluation;
  @override
  $ImageIdPairCopyWith<$Res>? get storeImageIdPairs;
}

/// @nodoc
class __$$_UserReviewCopyWithImpl<$Res>
    extends _$UserReviewCopyWithImpl<$Res, _$_UserReview>
    implements _$$_UserReviewCopyWith<$Res> {
  __$$_UserReviewCopyWithImpl(
      _$_UserReview _value, $Res Function(_$_UserReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? storeId = null,
    Object? storeName = null,
    Object? content = freezed,
    Object? visitCnt = null,
    Object? recommendation = null,
    Object? detailEvaluation = null,
    Object? reviewImageIdPairs = freezed,
    Object? storeImageIdPairs = freezed,
    Object? registeredDateTime = null,
  }) {
    return _then(_$_UserReview(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCnt: null == visitCnt
          ? _value.visitCnt
          : visitCnt // ignore: cast_nullable_to_non_nullable
              as int,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      detailEvaluation: null == detailEvaluation
          ? _value.detailEvaluation
          : detailEvaluation // ignore: cast_nullable_to_non_nullable
              as DetailEvaluation,
      reviewImageIdPairs: freezed == reviewImageIdPairs
          ? _value._reviewImageIdPairs
          : reviewImageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      storeImageIdPairs: freezed == storeImageIdPairs
          ? _value.storeImageIdPairs
          : storeImageIdPairs // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserReview implements _UserReview {
  _$_UserReview(
      {required this.reviewId,
      required this.storeId,
      required this.storeName,
      this.content,
      required this.visitCnt,
      required this.recommendation,
      required this.detailEvaluation,
      @JsonKey(name: 'reviewImageDto')
          final List<ImageIdPair>? reviewImageIdPairs,
      @JsonKey(name: 'storeImage')
          this.storeImageIdPairs,
      @JsonKey(name: 'regDateTime')
          required this.registeredDateTime})
      : _reviewImageIdPairs = reviewImageIdPairs;

  factory _$_UserReview.fromJson(Map<String, dynamic> json) =>
      _$$_UserReviewFromJson(json);

  @override
  final int reviewId;
  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final String? content;
  @override
  final int visitCnt;
  @override
  final String recommendation;
  @override
  final DetailEvaluation detailEvaluation;
  final List<ImageIdPair>? _reviewImageIdPairs;
  @override
  @JsonKey(name: 'reviewImageDto')
  List<ImageIdPair>? get reviewImageIdPairs {
    final value = _reviewImageIdPairs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'storeImage')
  final ImageIdPair? storeImageIdPairs;
  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'UserReview(reviewId: $reviewId, storeId: $storeId, storeName: $storeName, content: $content, visitCnt: $visitCnt, recommendation: $recommendation, detailEvaluation: $detailEvaluation, reviewImageIdPairs: $reviewImageIdPairs, storeImageIdPairs: $storeImageIdPairs, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserReview &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.visitCnt, visitCnt) ||
                other.visitCnt == visitCnt) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.detailEvaluation, detailEvaluation) ||
                other.detailEvaluation == detailEvaluation) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageIdPairs, _reviewImageIdPairs) &&
            (identical(other.storeImageIdPairs, storeImageIdPairs) ||
                other.storeImageIdPairs == storeImageIdPairs) &&
            (identical(other.registeredDateTime, registeredDateTime) ||
                other.registeredDateTime == registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      storeId,
      storeName,
      content,
      visitCnt,
      recommendation,
      detailEvaluation,
      const DeepCollectionEquality().hash(_reviewImageIdPairs),
      storeImageIdPairs,
      registeredDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserReviewCopyWith<_$_UserReview> get copyWith =>
      __$$_UserReviewCopyWithImpl<_$_UserReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserReviewToJson(
      this,
    );
  }
}

abstract class _UserReview implements UserReview {
  factory _UserReview(
      {required final int reviewId,
      required final int storeId,
      required final String storeName,
      final String? content,
      required final int visitCnt,
      required final String recommendation,
      required final DetailEvaluation detailEvaluation,
      @JsonKey(name: 'reviewImageDto')
          final List<ImageIdPair>? reviewImageIdPairs,
      @JsonKey(name: 'storeImage')
          final ImageIdPair? storeImageIdPairs,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_UserReview;

  factory _UserReview.fromJson(Map<String, dynamic> json) =
      _$_UserReview.fromJson;

  @override
  int get reviewId;
  @override
  int get storeId;
  @override
  String get storeName;
  @override
  String? get content;
  @override
  int get visitCnt;
  @override
  String get recommendation;
  @override
  DetailEvaluation get detailEvaluation;
  @override
  @JsonKey(name: 'reviewImageDto')
  List<ImageIdPair>? get reviewImageIdPairs;
  @override
  @JsonKey(name: 'storeImage')
  ImageIdPair? get storeImageIdPairs;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserReviewCopyWith<_$_UserReview> get copyWith =>
      throw _privateConstructorUsedError;
}
