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
      _$ReportRequestCopyWithImpl<$Res>;
  $Res call({int reviewId, int reportCategoryId, String content});
}

/// @nodoc
class _$ReportRequestCopyWithImpl<$Res>
    implements $ReportRequestCopyWith<$Res> {
  _$ReportRequestCopyWithImpl(this._value, this._then);

  final ReportRequest _value;
  // ignore: unused_field
  final $Res Function(ReportRequest) _then;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? reportCategoryId = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      reportCategoryId: reportCategoryId == freezed
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReportRequestCopyWith<$Res>
    implements $ReportRequestCopyWith<$Res> {
  factory _$$_ReportRequestCopyWith(
          _$_ReportRequest value, $Res Function(_$_ReportRequest) then) =
      __$$_ReportRequestCopyWithImpl<$Res>;
  @override
  $Res call({int reviewId, int reportCategoryId, String content});
}

/// @nodoc
class __$$_ReportRequestCopyWithImpl<$Res>
    extends _$ReportRequestCopyWithImpl<$Res>
    implements _$$_ReportRequestCopyWith<$Res> {
  __$$_ReportRequestCopyWithImpl(
      _$_ReportRequest _value, $Res Function(_$_ReportRequest) _then)
      : super(_value, (v) => _then(v as _$_ReportRequest));

  @override
  _$_ReportRequest get _value => super._value as _$_ReportRequest;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? reportCategoryId = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ReportRequest(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      reportCategoryId: reportCategoryId == freezed
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
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
            const DeepCollectionEquality().equals(other.reviewId, reviewId) &&
            const DeepCollectionEquality()
                .equals(other.reportCategoryId, reportCategoryId) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reviewId),
      const DeepCollectionEquality().hash(reportCategoryId),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      __$$_ReportRequestCopyWithImpl<_$_ReportRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportRequestToJson(this);
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
  int get reviewId => throw _privateConstructorUsedError;
  @override
  int get reportCategoryId => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
