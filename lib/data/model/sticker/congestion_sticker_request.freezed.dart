// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'congestion_sticker_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CongestionStickerRequest _$CongestionStickerRequestFromJson(
    Map<String, dynamic> json) {
  return _CongestionStickerRequest.fromJson(json);
}

/// @nodoc
mixin _$CongestionStickerRequest {
  int get congestionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CongestionStickerRequestCopyWith<CongestionStickerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CongestionStickerRequestCopyWith<$Res> {
  factory $CongestionStickerRequestCopyWith(CongestionStickerRequest value,
          $Res Function(CongestionStickerRequest) then) =
      _$CongestionStickerRequestCopyWithImpl<$Res, CongestionStickerRequest>;
  @useResult
  $Res call({int congestionId});
}

/// @nodoc
class _$CongestionStickerRequestCopyWithImpl<$Res,
        $Val extends CongestionStickerRequest>
    implements $CongestionStickerRequestCopyWith<$Res> {
  _$CongestionStickerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? congestionId = null,
  }) {
    return _then(_value.copyWith(
      congestionId: null == congestionId
          ? _value.congestionId
          : congestionId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CongestionStickerRequestCopyWith<$Res>
    implements $CongestionStickerRequestCopyWith<$Res> {
  factory _$$_CongestionStickerRequestCopyWith(
          _$_CongestionStickerRequest value,
          $Res Function(_$_CongestionStickerRequest) then) =
      __$$_CongestionStickerRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int congestionId});
}

/// @nodoc
class __$$_CongestionStickerRequestCopyWithImpl<$Res>
    extends _$CongestionStickerRequestCopyWithImpl<$Res,
        _$_CongestionStickerRequest>
    implements _$$_CongestionStickerRequestCopyWith<$Res> {
  __$$_CongestionStickerRequestCopyWithImpl(_$_CongestionStickerRequest _value,
      $Res Function(_$_CongestionStickerRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? congestionId = null,
  }) {
    return _then(_$_CongestionStickerRequest(
      congestionId: null == congestionId
          ? _value.congestionId
          : congestionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CongestionStickerRequest implements _CongestionStickerRequest {
  _$_CongestionStickerRequest({required this.congestionId});

  factory _$_CongestionStickerRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CongestionStickerRequestFromJson(json);

  @override
  final int congestionId;

  @override
  String toString() {
    return 'CongestionStickerRequest(congestionId: $congestionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CongestionStickerRequest &&
            (identical(other.congestionId, congestionId) ||
                other.congestionId == congestionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, congestionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CongestionStickerRequestCopyWith<_$_CongestionStickerRequest>
      get copyWith => __$$_CongestionStickerRequestCopyWithImpl<
          _$_CongestionStickerRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CongestionStickerRequestToJson(
      this,
    );
  }
}

abstract class _CongestionStickerRequest implements CongestionStickerRequest {
  factory _CongestionStickerRequest({required final int congestionId}) =
      _$_CongestionStickerRequest;

  factory _CongestionStickerRequest.fromJson(Map<String, dynamic> json) =
      _$_CongestionStickerRequest.fromJson;

  @override
  int get congestionId;
  @override
  @JsonKey(ignore: true)
  _$$_CongestionStickerRequestCopyWith<_$_CongestionStickerRequest>
      get copyWith => throw _privateConstructorUsedError;
}
