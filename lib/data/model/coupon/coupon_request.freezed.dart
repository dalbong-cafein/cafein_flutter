// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponRequest _$CouponRequestFromJson(Map<String, dynamic> json) {
  return _CouponRequest.fromJson(json);
}

/// @nodoc
mixin _$CouponRequest {
  String get brandName => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponRequestCopyWith<CouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponRequestCopyWith<$Res> {
  factory $CouponRequestCopyWith(
          CouponRequest value, $Res Function(CouponRequest) then) =
      _$CouponRequestCopyWithImpl<$Res>;
  $Res call({String brandName, String itemName});
}

/// @nodoc
class _$CouponRequestCopyWithImpl<$Res>
    implements $CouponRequestCopyWith<$Res> {
  _$CouponRequestCopyWithImpl(this._value, this._then);

  final CouponRequest _value;
  // ignore: unused_field
  final $Res Function(CouponRequest) _then;

  @override
  $Res call({
    Object? brandName = freezed,
    Object? itemName = freezed,
  }) {
    return _then(_value.copyWith(
      brandName: brandName == freezed
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CouponRequestCopyWith<$Res>
    implements $CouponRequestCopyWith<$Res> {
  factory _$$_CouponRequestCopyWith(
          _$_CouponRequest value, $Res Function(_$_CouponRequest) then) =
      __$$_CouponRequestCopyWithImpl<$Res>;
  @override
  $Res call({String brandName, String itemName});
}

/// @nodoc
class __$$_CouponRequestCopyWithImpl<$Res>
    extends _$CouponRequestCopyWithImpl<$Res>
    implements _$$_CouponRequestCopyWith<$Res> {
  __$$_CouponRequestCopyWithImpl(
      _$_CouponRequest _value, $Res Function(_$_CouponRequest) _then)
      : super(_value, (v) => _then(v as _$_CouponRequest));

  @override
  _$_CouponRequest get _value => super._value as _$_CouponRequest;

  @override
  $Res call({
    Object? brandName = freezed,
    Object? itemName = freezed,
  }) {
    return _then(_$_CouponRequest(
      brandName: brandName == freezed
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponRequest implements _CouponRequest {
  _$_CouponRequest({required this.brandName, required this.itemName});

  factory _$_CouponRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CouponRequestFromJson(json);

  @override
  final String brandName;
  @override
  final String itemName;

  @override
  String toString() {
    return 'CouponRequest(brandName: $brandName, itemName: $itemName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponRequest &&
            const DeepCollectionEquality().equals(other.brandName, brandName) &&
            const DeepCollectionEquality().equals(other.itemName, itemName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brandName),
      const DeepCollectionEquality().hash(itemName));

  @JsonKey(ignore: true)
  @override
  _$$_CouponRequestCopyWith<_$_CouponRequest> get copyWith =>
      __$$_CouponRequestCopyWithImpl<_$_CouponRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponRequestToJson(
      this,
    );
  }
}

abstract class _CouponRequest implements CouponRequest {
  factory _CouponRequest(
      {required final String brandName,
      required final String itemName}) = _$_CouponRequest;

  factory _CouponRequest.fromJson(Map<String, dynamic> json) =
      _$_CouponRequest.fromJson;

  @override
  String get brandName;
  @override
  String get itemName;
  @override
  @JsonKey(ignore: true)
  _$$_CouponRequestCopyWith<_$_CouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
