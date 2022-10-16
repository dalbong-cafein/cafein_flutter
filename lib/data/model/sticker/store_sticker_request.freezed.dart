// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_sticker_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreStickerRequest _$StoreStickerRequestFromJson(Map<String, dynamic> json) {
  return _StoreStickerRequest.fromJson(json);
}

/// @nodoc
mixin _$StoreStickerRequest {
  int get storeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreStickerRequestCopyWith<StoreStickerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreStickerRequestCopyWith<$Res> {
  factory $StoreStickerRequestCopyWith(
          StoreStickerRequest value, $Res Function(StoreStickerRequest) then) =
      _$StoreStickerRequestCopyWithImpl<$Res, StoreStickerRequest>;
  @useResult
  $Res call({int storeId});
}

/// @nodoc
class _$StoreStickerRequestCopyWithImpl<$Res, $Val extends StoreStickerRequest>
    implements $StoreStickerRequestCopyWith<$Res> {
  _$StoreStickerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreStickerRequestCopyWith<$Res>
    implements $StoreStickerRequestCopyWith<$Res> {
  factory _$$_StoreStickerRequestCopyWith(_$_StoreStickerRequest value,
          $Res Function(_$_StoreStickerRequest) then) =
      __$$_StoreStickerRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int storeId});
}

/// @nodoc
class __$$_StoreStickerRequestCopyWithImpl<$Res>
    extends _$StoreStickerRequestCopyWithImpl<$Res, _$_StoreStickerRequest>
    implements _$$_StoreStickerRequestCopyWith<$Res> {
  __$$_StoreStickerRequestCopyWithImpl(_$_StoreStickerRequest _value,
      $Res Function(_$_StoreStickerRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_$_StoreStickerRequest(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreStickerRequest implements _StoreStickerRequest {
  _$_StoreStickerRequest({required this.storeId});

  factory _$_StoreStickerRequest.fromJson(Map<String, dynamic> json) =>
      _$$_StoreStickerRequestFromJson(json);

  @override
  final int storeId;

  @override
  String toString() {
    return 'StoreStickerRequest(storeId: $storeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreStickerRequest &&
            (identical(other.storeId, storeId) || other.storeId == storeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreStickerRequestCopyWith<_$_StoreStickerRequest> get copyWith =>
      __$$_StoreStickerRequestCopyWithImpl<_$_StoreStickerRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreStickerRequestToJson(
      this,
    );
  }
}

abstract class _StoreStickerRequest implements StoreStickerRequest {
  factory _StoreStickerRequest({required final int storeId}) =
      _$_StoreStickerRequest;

  factory _StoreStickerRequest.fromJson(Map<String, dynamic> json) =
      _$_StoreStickerRequest.fromJson;

  @override
  int get storeId;
  @override
  @JsonKey(ignore: true)
  _$$_StoreStickerRequestCopyWith<_$_StoreStickerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
