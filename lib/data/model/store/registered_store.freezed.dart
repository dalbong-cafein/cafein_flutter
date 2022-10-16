// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registered_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisteredStore _$RegisteredStoreFromJson(Map<String, dynamic> json) {
  return _RegisteredStore.fromJson(json);
}

/// @nodoc
mixin _$RegisteredStore {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImageDto')
  ImageIdPair? get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisteredStoreCopyWith<RegisteredStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteredStoreCopyWith<$Res> {
  factory $RegisteredStoreCopyWith(
          RegisteredStore value, $Res Function(RegisteredStore) then) =
      _$RegisteredStoreCopyWithImpl<$Res, RegisteredStore>;
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo businessInfo,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair? imageIdPair,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  $BusinessInfoCopyWith<$Res> get businessInfo;
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class _$RegisteredStoreCopyWithImpl<$Res, $Val extends RegisteredStore>
    implements $RegisteredStoreCopyWith<$Res> {
  _$RegisteredStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? businessInfo = null,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
    Object? registeredDateTime = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      businessInfo: null == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessInfoCopyWith<$Res> get businessInfo {
    return $BusinessInfoCopyWith<$Res>(_value.businessInfo, (value) {
      return _then(_value.copyWith(businessInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageIdPairCopyWith<$Res>? get imageIdPair {
    if (_value.imageIdPair == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair!, (value) {
      return _then(_value.copyWith(imageIdPair: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RegisteredStoreCopyWith<$Res>
    implements $RegisteredStoreCopyWith<$Res> {
  factory _$$_RegisteredStoreCopyWith(
          _$_RegisteredStore value, $Res Function(_$_RegisteredStore) then) =
      __$$_RegisteredStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo businessInfo,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair? imageIdPair,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  @override
  $BusinessInfoCopyWith<$Res> get businessInfo;
  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class __$$_RegisteredStoreCopyWithImpl<$Res>
    extends _$RegisteredStoreCopyWithImpl<$Res, _$_RegisteredStore>
    implements _$$_RegisteredStoreCopyWith<$Res> {
  __$$_RegisteredStoreCopyWithImpl(
      _$_RegisteredStore _value, $Res Function(_$_RegisteredStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? businessInfo = null,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
    Object? registeredDateTime = null,
  }) {
    return _then(_$_RegisteredStore(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      businessInfo: null == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisteredStore implements _RegisteredStore {
  _$_RegisteredStore(
      {required this.storeId,
      required this.storeName,
      @JsonKey(name: 'businessHoursInfoDto') required this.businessInfo,
      this.congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') this.imageIdPair,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime});

  factory _$_RegisteredStore.fromJson(Map<String, dynamic> json) =>
      _$$_RegisteredStoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  final BusinessInfo businessInfo;
  @override
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'storeImageDto')
  final ImageIdPair? imageIdPair;
  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'RegisteredStore(storeId: $storeId, storeName: $storeName, businessInfo: $businessInfo, congestionScoreAvg: $congestionScoreAvg, imageIdPair: $imageIdPair, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisteredStore &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.businessInfo, businessInfo) ||
                other.businessInfo == businessInfo) &&
            (identical(other.congestionScoreAvg, congestionScoreAvg) ||
                other.congestionScoreAvg == congestionScoreAvg) &&
            (identical(other.imageIdPair, imageIdPair) ||
                other.imageIdPair == imageIdPair) &&
            (identical(other.registeredDateTime, registeredDateTime) ||
                other.registeredDateTime == registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId, storeName, businessInfo,
      congestionScoreAvg, imageIdPair, registeredDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisteredStoreCopyWith<_$_RegisteredStore> get copyWith =>
      __$$_RegisteredStoreCopyWithImpl<_$_RegisteredStore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisteredStoreToJson(
      this,
    );
  }
}

abstract class _RegisteredStore implements RegisteredStore {
  factory _RegisteredStore(
      {required final int storeId,
      required final String storeName,
      @JsonKey(name: 'businessHoursInfoDto')
          required final BusinessInfo businessInfo,
      final double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto')
          final ImageIdPair? imageIdPair,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_RegisteredStore;

  factory _RegisteredStore.fromJson(Map<String, dynamic> json) =
      _$_RegisteredStore.fromJson;

  @override
  int get storeId;
  @override
  String get storeName;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo;
  @override
  double? get congestionScoreAvg;
  @override
  @JsonKey(name: 'storeImageDto')
  ImageIdPair? get imageIdPair;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_RegisteredStoreCopyWith<_$_RegisteredStore> get copyWith =>
      throw _privateConstructorUsedError;
}
