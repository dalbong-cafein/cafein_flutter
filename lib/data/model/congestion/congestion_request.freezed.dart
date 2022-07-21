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
      _$CongestionRequestCopyWithImpl<$Res>;
  $Res call({int storeId, int congestionScore});
}

/// @nodoc
class _$CongestionRequestCopyWithImpl<$Res>
    implements $CongestionRequestCopyWith<$Res> {
  _$CongestionRequestCopyWithImpl(this._value, this._then);

  final CongestionRequest _value;
  // ignore: unused_field
  final $Res Function(CongestionRequest) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? congestionScore = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      congestionScore: congestionScore == freezed
          ? _value.congestionScore
          : congestionScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CongestionRequestCopyWith<$Res>
    implements $CongestionRequestCopyWith<$Res> {
  factory _$$_CongestionRequestCopyWith(_$_CongestionRequest value,
          $Res Function(_$_CongestionRequest) then) =
      __$$_CongestionRequestCopyWithImpl<$Res>;
  @override
  $Res call({int storeId, int congestionScore});
}

/// @nodoc
class __$$_CongestionRequestCopyWithImpl<$Res>
    extends _$CongestionRequestCopyWithImpl<$Res>
    implements _$$_CongestionRequestCopyWith<$Res> {
  __$$_CongestionRequestCopyWithImpl(
      _$_CongestionRequest _value, $Res Function(_$_CongestionRequest) _then)
      : super(_value, (v) => _then(v as _$_CongestionRequest));

  @override
  _$_CongestionRequest get _value => super._value as _$_CongestionRequest;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? congestionScore = freezed,
  }) {
    return _then(_$_CongestionRequest(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      congestionScore: congestionScore == freezed
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
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality()
                .equals(other.congestionScore, congestionScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(congestionScore));

  @JsonKey(ignore: true)
  @override
  _$$_CongestionRequestCopyWith<_$_CongestionRequest> get copyWith =>
      __$$_CongestionRequestCopyWithImpl<_$_CongestionRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CongestionRequestToJson(this);
  }
}

abstract class _CongestionRequest implements CongestionRequest {
  factory _CongestionRequest(
      {required final int storeId,
      required final int congestionScore}) = _$_CongestionRequest;

  factory _CongestionRequest.fromJson(Map<String, dynamic> json) =
      _$_CongestionRequest.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  int get congestionScore => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CongestionRequestCopyWith<_$_CongestionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
