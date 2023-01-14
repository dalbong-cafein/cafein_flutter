// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reported_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportedReview _$ReportedReviewFromJson(Map<String, dynamic> json) {
  return _ReportedReview.fromJson(json);
}

/// @nodoc
mixin _$ReportedReview {
  int get reviewId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  DetailEvaluation? get detailEvaluation => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get reviewImageIdPairs =>
      throw _privateConstructorUsedError;
  String get regDateTime => throw _privateConstructorUsedError;
  String get stopPostDateTime => throw _privateConstructorUsedError;
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  ImageIdPair? get storeImageDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportedReviewCopyWith<ReportedReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportedReviewCopyWith<$Res> {
  factory $ReportedReviewCopyWith(
          ReportedReview value, $Res Function(ReportedReview) then) =
      _$ReportedReviewCopyWithImpl<$Res, ReportedReview>;
  @useResult
  $Res call(
      {int reviewId,
      String content,
      String recommendation,
      DetailEvaluation? detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList')
          List<ImageIdPair>? reviewImageIdPairs,
      String regDateTime,
      String stopPostDateTime,
      int storeId,
      String storeName,
      ImageIdPair? storeImageDto});

  $DetailEvaluationCopyWith<$Res>? get detailEvaluation;
  $ImageIdPairCopyWith<$Res>? get storeImageDto;
}

/// @nodoc
class _$ReportedReviewCopyWithImpl<$Res, $Val extends ReportedReview>
    implements $ReportedReviewCopyWith<$Res> {
  _$ReportedReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? content = null,
    Object? recommendation = null,
    Object? detailEvaluation = freezed,
    Object? reviewImageIdPairs = freezed,
    Object? regDateTime = null,
    Object? stopPostDateTime = null,
    Object? storeId = null,
    Object? storeName = null,
    Object? storeImageDto = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      detailEvaluation: freezed == detailEvaluation
          ? _value.detailEvaluation
          : detailEvaluation // ignore: cast_nullable_to_non_nullable
              as DetailEvaluation?,
      reviewImageIdPairs: freezed == reviewImageIdPairs
          ? _value.reviewImageIdPairs
          : reviewImageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      regDateTime: null == regDateTime
          ? _value.regDateTime
          : regDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      stopPostDateTime: null == stopPostDateTime
          ? _value.stopPostDateTime
          : stopPostDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeImageDto: freezed == storeImageDto
          ? _value.storeImageDto
          : storeImageDto // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailEvaluationCopyWith<$Res>? get detailEvaluation {
    if (_value.detailEvaluation == null) {
      return null;
    }

    return $DetailEvaluationCopyWith<$Res>(_value.detailEvaluation!, (value) {
      return _then(_value.copyWith(detailEvaluation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageIdPairCopyWith<$Res>? get storeImageDto {
    if (_value.storeImageDto == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.storeImageDto!, (value) {
      return _then(_value.copyWith(storeImageDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReportedReviewCopyWith<$Res>
    implements $ReportedReviewCopyWith<$Res> {
  factory _$$_ReportedReviewCopyWith(
          _$_ReportedReview value, $Res Function(_$_ReportedReview) then) =
      __$$_ReportedReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int reviewId,
      String content,
      String recommendation,
      DetailEvaluation? detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList')
          List<ImageIdPair>? reviewImageIdPairs,
      String regDateTime,
      String stopPostDateTime,
      int storeId,
      String storeName,
      ImageIdPair? storeImageDto});

  @override
  $DetailEvaluationCopyWith<$Res>? get detailEvaluation;
  @override
  $ImageIdPairCopyWith<$Res>? get storeImageDto;
}

/// @nodoc
class __$$_ReportedReviewCopyWithImpl<$Res>
    extends _$ReportedReviewCopyWithImpl<$Res, _$_ReportedReview>
    implements _$$_ReportedReviewCopyWith<$Res> {
  __$$_ReportedReviewCopyWithImpl(
      _$_ReportedReview _value, $Res Function(_$_ReportedReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? content = null,
    Object? recommendation = null,
    Object? detailEvaluation = freezed,
    Object? reviewImageIdPairs = freezed,
    Object? regDateTime = null,
    Object? stopPostDateTime = null,
    Object? storeId = null,
    Object? storeName = null,
    Object? storeImageDto = freezed,
  }) {
    return _then(_$_ReportedReview(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      detailEvaluation: freezed == detailEvaluation
          ? _value.detailEvaluation
          : detailEvaluation // ignore: cast_nullable_to_non_nullable
              as DetailEvaluation?,
      reviewImageIdPairs: freezed == reviewImageIdPairs
          ? _value._reviewImageIdPairs
          : reviewImageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      regDateTime: null == regDateTime
          ? _value.regDateTime
          : regDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      stopPostDateTime: null == stopPostDateTime
          ? _value.stopPostDateTime
          : stopPostDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeImageDto: freezed == storeImageDto
          ? _value.storeImageDto
          : storeImageDto // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportedReview implements _ReportedReview {
  _$_ReportedReview(
      {required this.reviewId,
      required this.content,
      required this.recommendation,
      required this.detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList')
          final List<ImageIdPair>? reviewImageIdPairs,
      required this.regDateTime,
      required this.stopPostDateTime,
      required this.storeId,
      required this.storeName,
      required this.storeImageDto})
      : _reviewImageIdPairs = reviewImageIdPairs;

  factory _$_ReportedReview.fromJson(Map<String, dynamic> json) =>
      _$$_ReportedReviewFromJson(json);

  @override
  final int reviewId;
  @override
  final String content;
  @override
  final String recommendation;
  @override
  final DetailEvaluation? detailEvaluation;
  final List<ImageIdPair>? _reviewImageIdPairs;
  @override
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get reviewImageIdPairs {
    final value = _reviewImageIdPairs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String regDateTime;
  @override
  final String stopPostDateTime;
  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final ImageIdPair? storeImageDto;

  @override
  String toString() {
    return 'ReportedReview(reviewId: $reviewId, content: $content, recommendation: $recommendation, detailEvaluation: $detailEvaluation, reviewImageIdPairs: $reviewImageIdPairs, regDateTime: $regDateTime, stopPostDateTime: $stopPostDateTime, storeId: $storeId, storeName: $storeName, storeImageDto: $storeImageDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportedReview &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.detailEvaluation, detailEvaluation) ||
                other.detailEvaluation == detailEvaluation) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageIdPairs, _reviewImageIdPairs) &&
            (identical(other.regDateTime, regDateTime) ||
                other.regDateTime == regDateTime) &&
            (identical(other.stopPostDateTime, stopPostDateTime) ||
                other.stopPostDateTime == stopPostDateTime) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeImageDto, storeImageDto) ||
                other.storeImageDto == storeImageDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      content,
      recommendation,
      detailEvaluation,
      const DeepCollectionEquality().hash(_reviewImageIdPairs),
      regDateTime,
      stopPostDateTime,
      storeId,
      storeName,
      storeImageDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportedReviewCopyWith<_$_ReportedReview> get copyWith =>
      __$$_ReportedReviewCopyWithImpl<_$_ReportedReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportedReviewToJson(
      this,
    );
  }
}

abstract class _ReportedReview implements ReportedReview {
  factory _ReportedReview(
      {required final int reviewId,
      required final String content,
      required final String recommendation,
      required final DetailEvaluation? detailEvaluation,
      @JsonKey(name: 'reviewImageDtoList')
          final List<ImageIdPair>? reviewImageIdPairs,
      required final String regDateTime,
      required final String stopPostDateTime,
      required final int storeId,
      required final String storeName,
      required final ImageIdPair? storeImageDto}) = _$_ReportedReview;

  factory _ReportedReview.fromJson(Map<String, dynamic> json) =
      _$_ReportedReview.fromJson;

  @override
  int get reviewId;
  @override
  String get content;
  @override
  String get recommendation;
  @override
  DetailEvaluation? get detailEvaluation;
  @override
  @JsonKey(name: 'reviewImageDtoList')
  List<ImageIdPair>? get reviewImageIdPairs;
  @override
  String get regDateTime;
  @override
  String get stopPostDateTime;
  @override
  int get storeId;
  @override
  String get storeName;
  @override
  ImageIdPair? get storeImageDto;
  @override
  @JsonKey(ignore: true)
  _$$_ReportedReviewCopyWith<_$_ReportedReview> get copyWith =>
      throw _privateConstructorUsedError;
}
