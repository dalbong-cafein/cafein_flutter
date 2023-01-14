// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportNotification _$ReportNotificationFromJson(Map<String, dynamic> json) {
  return _ReportNotification.fromJson(json);
}

/// @nodoc
mixin _$ReportNotification {
  int get detailReportNoticeId => throw _privateConstructorUsedError;
  String get reportExpiredDateTime => throw _privateConstructorUsedError;
  String get reportCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'reportedReviewResDto')
  ReportedReview? get reportedReviewResDto =>
      throw _privateConstructorUsedError;
  bool get isPossibleObjection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportNotificationCopyWith<ReportNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportNotificationCopyWith<$Res> {
  factory $ReportNotificationCopyWith(
          ReportNotification value, $Res Function(ReportNotification) then) =
      _$ReportNotificationCopyWithImpl<$Res, ReportNotification>;
  @useResult
  $Res call(
      {int detailReportNoticeId,
      String reportExpiredDateTime,
      String reportCategoryName,
      @JsonKey(name: 'reportedReviewResDto')
          ReportedReview? reportedReviewResDto,
      bool isPossibleObjection});

  $ReportedReviewCopyWith<$Res>? get reportedReviewResDto;
}

/// @nodoc
class _$ReportNotificationCopyWithImpl<$Res, $Val extends ReportNotification>
    implements $ReportNotificationCopyWith<$Res> {
  _$ReportNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailReportNoticeId = null,
    Object? reportExpiredDateTime = null,
    Object? reportCategoryName = null,
    Object? reportedReviewResDto = freezed,
    Object? isPossibleObjection = null,
  }) {
    return _then(_value.copyWith(
      detailReportNoticeId: null == detailReportNoticeId
          ? _value.detailReportNoticeId
          : detailReportNoticeId // ignore: cast_nullable_to_non_nullable
              as int,
      reportExpiredDateTime: null == reportExpiredDateTime
          ? _value.reportExpiredDateTime
          : reportExpiredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      reportCategoryName: null == reportCategoryName
          ? _value.reportCategoryName
          : reportCategoryName // ignore: cast_nullable_to_non_nullable
              as String,
      reportedReviewResDto: freezed == reportedReviewResDto
          ? _value.reportedReviewResDto
          : reportedReviewResDto // ignore: cast_nullable_to_non_nullable
              as ReportedReview?,
      isPossibleObjection: null == isPossibleObjection
          ? _value.isPossibleObjection
          : isPossibleObjection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportedReviewCopyWith<$Res>? get reportedReviewResDto {
    if (_value.reportedReviewResDto == null) {
      return null;
    }

    return $ReportedReviewCopyWith<$Res>(_value.reportedReviewResDto!, (value) {
      return _then(_value.copyWith(reportedReviewResDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReportNotificationCopyWith<$Res>
    implements $ReportNotificationCopyWith<$Res> {
  factory _$$_ReportNotificationCopyWith(_$_ReportNotification value,
          $Res Function(_$_ReportNotification) then) =
      __$$_ReportNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int detailReportNoticeId,
      String reportExpiredDateTime,
      String reportCategoryName,
      @JsonKey(name: 'reportedReviewResDto')
          ReportedReview? reportedReviewResDto,
      bool isPossibleObjection});

  @override
  $ReportedReviewCopyWith<$Res>? get reportedReviewResDto;
}

/// @nodoc
class __$$_ReportNotificationCopyWithImpl<$Res>
    extends _$ReportNotificationCopyWithImpl<$Res, _$_ReportNotification>
    implements _$$_ReportNotificationCopyWith<$Res> {
  __$$_ReportNotificationCopyWithImpl(
      _$_ReportNotification _value, $Res Function(_$_ReportNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailReportNoticeId = null,
    Object? reportExpiredDateTime = null,
    Object? reportCategoryName = null,
    Object? reportedReviewResDto = freezed,
    Object? isPossibleObjection = null,
  }) {
    return _then(_$_ReportNotification(
      detailReportNoticeId: null == detailReportNoticeId
          ? _value.detailReportNoticeId
          : detailReportNoticeId // ignore: cast_nullable_to_non_nullable
              as int,
      reportExpiredDateTime: null == reportExpiredDateTime
          ? _value.reportExpiredDateTime
          : reportExpiredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      reportCategoryName: null == reportCategoryName
          ? _value.reportCategoryName
          : reportCategoryName // ignore: cast_nullable_to_non_nullable
              as String,
      reportedReviewResDto: freezed == reportedReviewResDto
          ? _value.reportedReviewResDto
          : reportedReviewResDto // ignore: cast_nullable_to_non_nullable
              as ReportedReview?,
      isPossibleObjection: null == isPossibleObjection
          ? _value.isPossibleObjection
          : isPossibleObjection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportNotification implements _ReportNotification {
  _$_ReportNotification(
      {required this.detailReportNoticeId,
      required this.reportExpiredDateTime,
      required this.reportCategoryName,
      @JsonKey(name: 'reportedReviewResDto') this.reportedReviewResDto,
      required this.isPossibleObjection});

  factory _$_ReportNotification.fromJson(Map<String, dynamic> json) =>
      _$$_ReportNotificationFromJson(json);

  @override
  final int detailReportNoticeId;
  @override
  final String reportExpiredDateTime;
  @override
  final String reportCategoryName;
  @override
  @JsonKey(name: 'reportedReviewResDto')
  final ReportedReview? reportedReviewResDto;
  @override
  final bool isPossibleObjection;

  @override
  String toString() {
    return 'ReportNotification(detailReportNoticeId: $detailReportNoticeId, reportExpiredDateTime: $reportExpiredDateTime, reportCategoryName: $reportCategoryName, reportedReviewResDto: $reportedReviewResDto, isPossibleObjection: $isPossibleObjection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportNotification &&
            (identical(other.detailReportNoticeId, detailReportNoticeId) ||
                other.detailReportNoticeId == detailReportNoticeId) &&
            (identical(other.reportExpiredDateTime, reportExpiredDateTime) ||
                other.reportExpiredDateTime == reportExpiredDateTime) &&
            (identical(other.reportCategoryName, reportCategoryName) ||
                other.reportCategoryName == reportCategoryName) &&
            (identical(other.reportedReviewResDto, reportedReviewResDto) ||
                other.reportedReviewResDto == reportedReviewResDto) &&
            (identical(other.isPossibleObjection, isPossibleObjection) ||
                other.isPossibleObjection == isPossibleObjection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      detailReportNoticeId,
      reportExpiredDateTime,
      reportCategoryName,
      reportedReviewResDto,
      isPossibleObjection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportNotificationCopyWith<_$_ReportNotification> get copyWith =>
      __$$_ReportNotificationCopyWithImpl<_$_ReportNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportNotificationToJson(
      this,
    );
  }
}

abstract class _ReportNotification implements ReportNotification {
  factory _ReportNotification(
      {required final int detailReportNoticeId,
      required final String reportExpiredDateTime,
      required final String reportCategoryName,
      @JsonKey(name: 'reportedReviewResDto')
          final ReportedReview? reportedReviewResDto,
      required final bool isPossibleObjection}) = _$_ReportNotification;

  factory _ReportNotification.fromJson(Map<String, dynamic> json) =
      _$_ReportNotification.fromJson;

  @override
  int get detailReportNoticeId;
  @override
  String get reportExpiredDateTime;
  @override
  String get reportCategoryName;
  @override
  @JsonKey(name: 'reportedReviewResDto')
  ReportedReview? get reportedReviewResDto;
  @override
  bool get isPossibleObjection;
  @override
  @JsonKey(ignore: true)
  _$$_ReportNotificationCopyWith<_$_ReportNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
