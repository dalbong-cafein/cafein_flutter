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
  String get content => throw _privateConstructorUsedError;
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
      _$UserReviewCopyWithImpl<$Res>;
  $Res call(
      {int reviewId,
      int storeId,
      String storeName,
      String content,
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
class _$UserReviewCopyWithImpl<$Res> implements $UserReviewCopyWith<$Res> {
  _$UserReviewCopyWithImpl(this._value, this._then);

  final UserReview _value;
  // ignore: unused_field
  final $Res Function(UserReview) _then;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? content = freezed,
    Object? visitCnt = freezed,
    Object? recommendation = freezed,
    Object? detailEvaluation = freezed,
    Object? reviewImageIdPairs = freezed,
    Object? storeImageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
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
      reviewImageIdPairs: reviewImageIdPairs == freezed
          ? _value.reviewImageIdPairs
          : reviewImageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      storeImageIdPairs: storeImageIdPairs == freezed
          ? _value.storeImageIdPairs
          : storeImageIdPairs // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
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

  @override
  $ImageIdPairCopyWith<$Res>? get storeImageIdPairs {
    if (_value.storeImageIdPairs == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.storeImageIdPairs!, (value) {
      return _then(_value.copyWith(storeImageIdPairs: value));
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
  $Res call(
      {int reviewId,
      int storeId,
      String storeName,
      String content,
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
class __$$_UserReviewCopyWithImpl<$Res> extends _$UserReviewCopyWithImpl<$Res>
    implements _$$_UserReviewCopyWith<$Res> {
  __$$_UserReviewCopyWithImpl(
      _$_UserReview _value, $Res Function(_$_UserReview) _then)
      : super(_value, (v) => _then(v as _$_UserReview));

  @override
  _$_UserReview get _value => super._value as _$_UserReview;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? content = freezed,
    Object? visitCnt = freezed,
    Object? recommendation = freezed,
    Object? detailEvaluation = freezed,
    Object? reviewImageIdPairs = freezed,
    Object? storeImageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_UserReview(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
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
      reviewImageIdPairs: reviewImageIdPairs == freezed
          ? _value._reviewImageIdPairs
          : reviewImageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      storeImageIdPairs: storeImageIdPairs == freezed
          ? _value.storeImageIdPairs
          : storeImageIdPairs // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      registeredDateTime: registeredDateTime == freezed
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
      required this.content,
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
  final String content;
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
            const DeepCollectionEquality().equals(other.reviewId, reviewId) &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.visitCnt, visitCnt) &&
            const DeepCollectionEquality()
                .equals(other.recommendation, recommendation) &&
            const DeepCollectionEquality()
                .equals(other.detailEvaluation, detailEvaluation) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageIdPairs, _reviewImageIdPairs) &&
            const DeepCollectionEquality()
                .equals(other.storeImageIdPairs, storeImageIdPairs) &&
            const DeepCollectionEquality()
                .equals(other.registeredDateTime, registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reviewId),
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(visitCnt),
      const DeepCollectionEquality().hash(recommendation),
      const DeepCollectionEquality().hash(detailEvaluation),
      const DeepCollectionEquality().hash(_reviewImageIdPairs),
      const DeepCollectionEquality().hash(storeImageIdPairs),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
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
      required final String content,
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
  String get content;
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
