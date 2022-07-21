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
      _$StoreStickerRequestCopyWithImpl<$Res>;
  $Res call({int storeId});
}

/// @nodoc
class _$StoreStickerRequestCopyWithImpl<$Res>
    implements $StoreStickerRequestCopyWith<$Res> {
  _$StoreStickerRequestCopyWithImpl(this._value, this._then);

  final StoreStickerRequest _value;
  // ignore: unused_field
  final $Res Function(StoreStickerRequest) _then;

  @override
  $Res call({
    Object? storeId = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StoreStickerRequestCopyWith<$Res>
    implements $StoreStickerRequestCopyWith<$Res> {
  factory _$$_StoreStickerRequestCopyWith(_$_StoreStickerRequest value,
          $Res Function(_$_StoreStickerRequest) then) =
      __$$_StoreStickerRequestCopyWithImpl<$Res>;
  @override
  $Res call({int storeId});
}

/// @nodoc
class __$$_StoreStickerRequestCopyWithImpl<$Res>
    extends _$StoreStickerRequestCopyWithImpl<$Res>
    implements _$$_StoreStickerRequestCopyWith<$Res> {
  __$$_StoreStickerRequestCopyWithImpl(_$_StoreStickerRequest _value,
      $Res Function(_$_StoreStickerRequest) _then)
      : super(_value, (v) => _then(v as _$_StoreStickerRequest));

  @override
  _$_StoreStickerRequest get _value => super._value as _$_StoreStickerRequest;

  @override
  $Res call({
    Object? storeId = freezed,
  }) {
    return _then(_$_StoreStickerRequest(
      storeId: storeId == freezed
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
            const DeepCollectionEquality().equals(other.storeId, storeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(storeId));

  @JsonKey(ignore: true)
  @override
  _$$_StoreStickerRequestCopyWith<_$_StoreStickerRequest> get copyWith =>
      __$$_StoreStickerRequestCopyWithImpl<_$_StoreStickerRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreStickerRequestToJson(this);
  }
}

abstract class _StoreStickerRequest implements StoreStickerRequest {
  factory _StoreStickerRequest({required final int storeId}) =
      _$_StoreStickerRequest;

  factory _StoreStickerRequest.fromJson(Map<String, dynamic> json) =
      _$_StoreStickerRequest.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreStickerRequestCopyWith<_$_StoreStickerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
