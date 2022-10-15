// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'congestion_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CongestionRequest _$CongestionRequestFromJson(Map<String, dynamic> json) {
  return _CongestionRequest.fromJson(json);
}

/// @nodoc
mixin _$CongestionRequest {
  int get storeId => throw _privateConstructorUsedError;
  int get congestionScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CongestionRequestCopyWith<CongestionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CongestionRequestCopyWith<$Res> {
  factory $CongestionRequestCopyWith(
          CongestionRequest value, $Res Function(CongestionRequest) then) =
      _$CongestionRequestCopyWithImpl<$Res, CongestionRequest>;
  @useResult
  $Res call({int storeId, int congestionScore});
}

/// @nodoc
class _$CongestionRequestCopyWithImpl<$Res, $Val extends CongestionRequest>
    implements $CongestionRequestCopyWith<$Res> {
  _$CongestionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? congestionScore = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      congestionScore: null == congestionScore
          ? _value.congestionScore
          : congestionScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CongestionRequestCopyWith<$Res>
    implements $CongestionRequestCopyWith<$Res> {
  factory _$$_CongestionRequestCopyWith(_$_CongestionRequest value,
          $Res Function(_$_CongestionRequest) then) =
      __$$_CongestionRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int storeId, int congestionScore});
}

/// @nodoc
class __$$_CongestionRequestCopyWithImpl<$Res>
    extends _$CongestionRequestCopyWithImpl<$Res, _$_CongestionRequest>
    implements _$$_CongestionRequestCopyWith<$Res> {
  __$$_CongestionRequestCopyWithImpl(
      _$_CongestionRequest _value, $Res Function(_$_CongestionRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? congestionScore = null,
  }) {
    return _then(_$_CongestionRequest(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      congestionScore: null == congestionScore
          ? _value.congestionScore
          : congestionScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CongestionRequest implements _CongestionRequest {
  _$_CongestionRequest({required this.storeId, required this.congestionScore});

  factory _$_CongestionRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CongestionRequestFromJson(json);

  @override
  final int storeId;
  @override
  final int congestionScore;

  @override
  String toString() {
    return 'CongestionRequest(storeId: $storeId, congestionScore: $congestionScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CongestionRequest &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.congestionScore, congestionScore) ||
                other.congestionScore == congestionScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId, congestionScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CongestionRequestCopyWith<_$_CongestionRequest> get copyWith =>
      __$$_CongestionRequestCopyWithImpl<_$_CongestionRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CongestionRequestToJson(
      this,
    );
  }
}

abstract class _CongestionRequest implements CongestionRequest {
  factory _CongestionRequest(
      {required final int storeId,
      required final int congestionScore}) = _$_CongestionRequest;

  factory _CongestionRequest.fromJson(Map<String, dynamic> json) =
      _$_CongestionRequest.fromJson;

  @override
  int get storeId;
  @override
  int get congestionScore;
  @override
  @JsonKey(ignore: true)
  _$$_CongestionRequestCopyWith<_$_CongestionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
