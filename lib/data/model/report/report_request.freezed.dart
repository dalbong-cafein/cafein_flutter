// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportRequest _$ReportRequestFromJson(Map<String, dynamic> json) {
  return _ReportRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportRequest {
  int get reviewId => throw _privateConstructorUsedError;
  int get reportCategoryId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportRequestCopyWith<ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportRequestCopyWith<$Res> {
  factory $ReportRequestCopyWith(
          ReportRequest value, $Res Function(ReportRequest) then) =
      _$ReportRequestCopyWithImpl<$Res, ReportRequest>;
  @useResult
  $Res call({int reviewId, int reportCategoryId, String content});
}

/// @nodoc
class _$ReportRequestCopyWithImpl<$Res, $Val extends ReportRequest>
    implements $ReportRequestCopyWith<$Res> {
  _$ReportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? reportCategoryId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      reportCategoryId: null == reportCategoryId
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportRequestCopyWith<$Res>
    implements $ReportRequestCopyWith<$Res> {
  factory _$$_ReportRequestCopyWith(
          _$_ReportRequest value, $Res Function(_$_ReportRequest) then) =
      __$$_ReportRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int reviewId, int reportCategoryId, String content});
}

/// @nodoc
class __$$_ReportRequestCopyWithImpl<$Res>
    extends _$ReportRequestCopyWithImpl<$Res, _$_ReportRequest>
    implements _$$_ReportRequestCopyWith<$Res> {
  __$$_ReportRequestCopyWithImpl(
      _$_ReportRequest _value, $Res Function(_$_ReportRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? reportCategoryId = null,
    Object? content = null,
  }) {
    return _then(_$_ReportRequest(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      reportCategoryId: null == reportCategoryId
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportRequest implements _ReportRequest {
  _$_ReportRequest(
      {required this.reviewId,
      required this.reportCategoryId,
      required this.content});

  factory _$_ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReportRequestFromJson(json);

  @override
  final int reviewId;
  @override
  final int reportCategoryId;
  @override
  final String content;

  @override
  String toString() {
    return 'ReportRequest(reviewId: $reviewId, reportCategoryId: $reportCategoryId, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportRequest &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.reportCategoryId, reportCategoryId) ||
                other.reportCategoryId == reportCategoryId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reviewId, reportCategoryId, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      __$$_ReportRequestCopyWithImpl<_$_ReportRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportRequestToJson(
      this,
    );
  }
}

abstract class _ReportRequest implements ReportRequest {
  factory _ReportRequest(
      {required final int reviewId,
      required final int reportCategoryId,
      required final String content}) = _$_ReportRequest;

  factory _ReportRequest.fromJson(Map<String, dynamic> json) =
      _$_ReportRequest.fromJson;

  @override
  int get reviewId;
  @override
  int get reportCategoryId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
