// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) {
  return _AddressInfo.fromJson(json);
}

/// @nodoc
mixin _$AddressInfo {
  @JsonKey(name: 'siNm')
  String get cityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sggNm')
  String get districtName => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'rnum')
  String get roadNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'rnm')
  String get roadName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressInfoCopyWith<AddressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressInfoCopyWith<$Res> {
  factory $AddressInfoCopyWith(
          AddressInfo value, $Res Function(AddressInfo) then) =
      _$AddressInfoCopyWithImpl<$Res, AddressInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'siNm') String cityName,
      @JsonKey(name: 'sggNm') String districtName,
      String detail,
      String fullAddress,
      @JsonKey(name: 'rnum') String roadNumber,
      @JsonKey(name: 'rnm') String roadName});
}

/// @nodoc
class _$AddressInfoCopyWithImpl<$Res, $Val extends AddressInfo>
    implements $AddressInfoCopyWith<$Res> {
  _$AddressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? districtName = null,
    Object? detail = null,
    Object? fullAddress = null,
    Object? roadNumber = null,
    Object? roadName = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: null == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
      roadNumber: null == roadNumber
          ? _value.roadNumber
          : roadNumber // ignore: cast_nullable_to_non_nullable
              as String,
      roadName: null == roadName
          ? _value.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressInfoCopyWith<$Res>
    implements $AddressInfoCopyWith<$Res> {
  factory _$$_AddressInfoCopyWith(
          _$_AddressInfo value, $Res Function(_$_AddressInfo) then) =
      __$$_AddressInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'siNm') String cityName,
      @JsonKey(name: 'sggNm') String districtName,
      String detail,
      String fullAddress,
      @JsonKey(name: 'rnum') String roadNumber,
      @JsonKey(name: 'rnm') String roadName});
}

/// @nodoc
class __$$_AddressInfoCopyWithImpl<$Res>
    extends _$AddressInfoCopyWithImpl<$Res, _$_AddressInfo>
    implements _$$_AddressInfoCopyWith<$Res> {
  __$$_AddressInfoCopyWithImpl(
      _$_AddressInfo _value, $Res Function(_$_AddressInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? districtName = null,
    Object? detail = null,
    Object? fullAddress = null,
    Object? roadNumber = null,
    Object? roadName = null,
  }) {
    return _then(_$_AddressInfo(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: null == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
      roadNumber: null == roadNumber
          ? _value.roadNumber
          : roadNumber // ignore: cast_nullable_to_non_nullable
              as String,
      roadName: null == roadName
          ? _value.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressInfo implements _AddressInfo {
  _$_AddressInfo(
      {@JsonKey(name: 'siNm') required this.cityName,
      @JsonKey(name: 'sggNm') required this.districtName,
      required this.detail,
      required this.fullAddress,
      @JsonKey(name: 'rnum') required this.roadNumber,
      @JsonKey(name: 'rnm') required this.roadName});

  factory _$_AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$$_AddressInfoFromJson(json);

  @override
  @JsonKey(name: 'siNm')
  final String cityName;
  @override
  @JsonKey(name: 'sggNm')
  final String districtName;
  @override
  final String detail;
  @override
  final String fullAddress;
  @override
  @JsonKey(name: 'rnum')
  final String roadNumber;
  @override
  @JsonKey(name: 'rnm')
  final String roadName;

  @override
  String toString() {
    return 'AddressInfo(cityName: $cityName, districtName: $districtName, detail: $detail, fullAddress: $fullAddress, roadNumber: $roadNumber, roadName: $roadName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressInfo &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.roadNumber, roadNumber) ||
                other.roadNumber == roadNumber) &&
            (identical(other.roadName, roadName) ||
                other.roadName == roadName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cityName, districtName, detail,
      fullAddress, roadNumber, roadName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressInfoCopyWith<_$_AddressInfo> get copyWith =>
      __$$_AddressInfoCopyWithImpl<_$_AddressInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressInfoToJson(
      this,
    );
  }
}

abstract class _AddressInfo implements AddressInfo {
  factory _AddressInfo(
      {@JsonKey(name: 'siNm') required final String cityName,
      @JsonKey(name: 'sggNm') required final String districtName,
      required final String detail,
      required final String fullAddress,
      @JsonKey(name: 'rnum') required final String roadNumber,
      @JsonKey(name: 'rnm') required final String roadName}) = _$_AddressInfo;

  factory _AddressInfo.fromJson(Map<String, dynamic> json) =
      _$_AddressInfo.fromJson;

  @override
  @JsonKey(name: 'siNm')
  String get cityName;
  @override
  @JsonKey(name: 'sggNm')
  String get districtName;
  @override
  String get detail;
  @override
  String get fullAddress;
  @override
  @JsonKey(name: 'rnum')
  String get roadNumber;
  @override
  @JsonKey(name: 'rnm')
  String get roadName;
  @override
  @JsonKey(ignore: true)
  _$$_AddressInfoCopyWith<_$_AddressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
