// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberStore _$MemberStoreFromJson(Map<String, dynamic> json) {
  return _MemberStore.fromJson(json);
}

/// @nodoc
mixin _$MemberStore {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  double get lngX => throw _privateConstructorUsedError;
  double get latY => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo? get businessInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImageDto')
  ImageIdPair? get imageIdPair => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberStoreCopyWith<MemberStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberStoreCopyWith<$Res> {
  factory $MemberStoreCopyWith(
          MemberStore value, $Res Function(MemberStore) then) =
      _$MemberStoreCopyWithImpl<$Res, MemberStore>;
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      double lngX,
      double latY,
      double? congestionScoreAvg,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo? businessInfo,
      @JsonKey(name: 'storeImageDto') ImageIdPair? imageIdPair});

  $BusinessInfoCopyWith<$Res>? get businessInfo;
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class _$MemberStoreCopyWithImpl<$Res, $Val extends MemberStore>
    implements $MemberStoreCopyWith<$Res> {
  _$MemberStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? lngX = null,
    Object? latY = null,
    Object? congestionScoreAvg = freezed,
    Object? businessInfo = freezed,
    Object? imageIdPair = freezed,
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
      lngX: null == lngX
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: null == latY
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      businessInfo: freezed == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessInfoCopyWith<$Res>? get businessInfo {
    if (_value.businessInfo == null) {
      return null;
    }

    return $BusinessInfoCopyWith<$Res>(_value.businessInfo!, (value) {
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
abstract class _$$_MemberStoreCopyWith<$Res>
    implements $MemberStoreCopyWith<$Res> {
  factory _$$_MemberStoreCopyWith(
          _$_MemberStore value, $Res Function(_$_MemberStore) then) =
      __$$_MemberStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      double lngX,
      double latY,
      double? congestionScoreAvg,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo? businessInfo,
      @JsonKey(name: 'storeImageDto') ImageIdPair? imageIdPair});

  @override
  $BusinessInfoCopyWith<$Res>? get businessInfo;
  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class __$$_MemberStoreCopyWithImpl<$Res>
    extends _$MemberStoreCopyWithImpl<$Res, _$_MemberStore>
    implements _$$_MemberStoreCopyWith<$Res> {
  __$$_MemberStoreCopyWithImpl(
      _$_MemberStore _value, $Res Function(_$_MemberStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? lngX = null,
    Object? latY = null,
    Object? congestionScoreAvg = freezed,
    Object? businessInfo = freezed,
    Object? imageIdPair = freezed,
  }) {
    return _then(_$_MemberStore(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      lngX: null == lngX
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: null == latY
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      businessInfo: freezed == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberStore implements _MemberStore {
  _$_MemberStore(
      {required this.storeId,
      required this.storeName,
      required this.lngX,
      required this.latY,
      this.congestionScoreAvg,
      @JsonKey(name: 'businessHoursInfoDto') this.businessInfo,
      @JsonKey(name: 'storeImageDto') this.imageIdPair});

  factory _$_MemberStore.fromJson(Map<String, dynamic> json) =>
      _$$_MemberStoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final double lngX;
  @override
  final double latY;
  @override
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  final BusinessInfo? businessInfo;
  @override
  @JsonKey(name: 'storeImageDto')
  final ImageIdPair? imageIdPair;

  @override
  String toString() {
    return 'MemberStore(storeId: $storeId, storeName: $storeName, lngX: $lngX, latY: $latY, congestionScoreAvg: $congestionScoreAvg, businessInfo: $businessInfo, imageIdPair: $imageIdPair)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberStore &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.lngX, lngX) || other.lngX == lngX) &&
            (identical(other.latY, latY) || other.latY == latY) &&
            (identical(other.congestionScoreAvg, congestionScoreAvg) ||
                other.congestionScoreAvg == congestionScoreAvg) &&
            (identical(other.businessInfo, businessInfo) ||
                other.businessInfo == businessInfo) &&
            (identical(other.imageIdPair, imageIdPair) ||
                other.imageIdPair == imageIdPair));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId, storeName, lngX, latY,
      congestionScoreAvg, businessInfo, imageIdPair);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberStoreCopyWith<_$_MemberStore> get copyWith =>
      __$$_MemberStoreCopyWithImpl<_$_MemberStore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberStoreToJson(
      this,
    );
  }
}

abstract class _MemberStore implements MemberStore {
  factory _MemberStore(
      {required final int storeId,
      required final String storeName,
      required final double lngX,
      required final double latY,
      final double? congestionScoreAvg,
      @JsonKey(name: 'businessHoursInfoDto')
          final BusinessInfo? businessInfo,
      @JsonKey(name: 'storeImageDto')
          final ImageIdPair? imageIdPair}) = _$_MemberStore;

  factory _MemberStore.fromJson(Map<String, dynamic> json) =
      _$_MemberStore.fromJson;

  @override
  int get storeId;
  @override
  String get storeName;
  @override
  double get lngX;
  @override
  double get latY;
  @override
  double? get congestionScoreAvg;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo? get businessInfo;
  @override
  @JsonKey(name: 'storeImageDto')
  ImageIdPair? get imageIdPair;
  @override
  @JsonKey(ignore: true)
  _$$_MemberStoreCopyWith<_$_MemberStore> get copyWith =>
      throw _privateConstructorUsedError;
}
