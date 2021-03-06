// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  int get recommendPercent => throw _privateConstructorUsedError;
  double get lngX => throw _privateConstructorUsedError;
  double get latY => throw _privateConstructorUsedError;
  int get heartCnt => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {int storeId,
      String storeName,
      int recommendPercent,
      double lngX,
      double latY,
      int heartCnt,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo businessInfo});

  $ImageIdPairCopyWith<$Res> get imageIdPair;
  $BusinessInfoCopyWith<$Res> get businessInfo;
}

/// @nodoc
class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? recommendPercent = freezed,
    Object? lngX = freezed,
    Object? latY = freezed,
    Object? heartCnt = freezed,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
    Object? businessInfo = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendPercent: recommendPercent == freezed
          ? _value.recommendPercent
          : recommendPercent // ignore: cast_nullable_to_non_nullable
              as int,
      lngX: lngX == freezed
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: latY == freezed
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      heartCnt: heartCnt == freezed
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
      businessInfo: businessInfo == freezed
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
    ));
  }

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair {
    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair, (value) {
      return _then(_value.copyWith(imageIdPair: value));
    });
  }

  @override
  $BusinessInfoCopyWith<$Res> get businessInfo {
    return $BusinessInfoCopyWith<$Res>(_value.businessInfo, (value) {
      return _then(_value.copyWith(businessInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$_StoreCopyWith(_$_Store value, $Res Function(_$_Store) then) =
      __$$_StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {int storeId,
      String storeName,
      int recommendPercent,
      double lngX,
      double latY,
      int heartCnt,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo businessInfo});

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair;
  @override
  $BusinessInfoCopyWith<$Res> get businessInfo;
}

/// @nodoc
class __$$_StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$$_StoreCopyWith<$Res> {
  __$$_StoreCopyWithImpl(_$_Store _value, $Res Function(_$_Store) _then)
      : super(_value, (v) => _then(v as _$_Store));

  @override
  _$_Store get _value => super._value as _$_Store;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? recommendPercent = freezed,
    Object? lngX = freezed,
    Object? latY = freezed,
    Object? heartCnt = freezed,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
    Object? businessInfo = freezed,
  }) {
    return _then(_$_Store(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendPercent: recommendPercent == freezed
          ? _value.recommendPercent
          : recommendPercent // ignore: cast_nullable_to_non_nullable
              as int,
      lngX: lngX == freezed
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: latY == freezed
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      heartCnt: heartCnt == freezed
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
      businessInfo: businessInfo == freezed
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Store implements _Store {
  _$_Store(
      {required this.storeId,
      required this.storeName,
      required this.recommendPercent,
      required this.lngX,
      required this.latY,
      required this.heartCnt,
      this.congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') required this.imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') required this.businessInfo});

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$$_StoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final int recommendPercent;
  @override
  final double lngX;
  @override
  final double latY;
  @override
  final int heartCnt;
  @override
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'storeImageDto')
  final ImageIdPair imageIdPair;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  final BusinessInfo businessInfo;

  @override
  String toString() {
    return 'Store(storeId: $storeId, storeName: $storeName, recommendPercent: $recommendPercent, lngX: $lngX, latY: $latY, heartCnt: $heartCnt, congestionScoreAvg: $congestionScoreAvg, imageIdPair: $imageIdPair, businessInfo: $businessInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Store &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality()
                .equals(other.recommendPercent, recommendPercent) &&
            const DeepCollectionEquality().equals(other.lngX, lngX) &&
            const DeepCollectionEquality().equals(other.latY, latY) &&
            const DeepCollectionEquality().equals(other.heartCnt, heartCnt) &&
            const DeepCollectionEquality()
                .equals(other.congestionScoreAvg, congestionScoreAvg) &&
            const DeepCollectionEquality()
                .equals(other.imageIdPair, imageIdPair) &&
            const DeepCollectionEquality()
                .equals(other.businessInfo, businessInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(recommendPercent),
      const DeepCollectionEquality().hash(lngX),
      const DeepCollectionEquality().hash(latY),
      const DeepCollectionEquality().hash(heartCnt),
      const DeepCollectionEquality().hash(congestionScoreAvg),
      const DeepCollectionEquality().hash(imageIdPair),
      const DeepCollectionEquality().hash(businessInfo));

  @JsonKey(ignore: true)
  @override
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      __$$_StoreCopyWithImpl<_$_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreToJson(this);
  }
}

abstract class _Store implements Store {
  factory _Store(
      {required final int storeId,
      required final String storeName,
      required final int recommendPercent,
      required final double lngX,
      required final double latY,
      required final int heartCnt,
      final double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto')
          required final ImageIdPair imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto')
          required final BusinessInfo businessInfo}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  String get storeName => throw _privateConstructorUsedError;
  @override
  int get recommendPercent => throw _privateConstructorUsedError;
  @override
  double get lngX => throw _privateConstructorUsedError;
  @override
  double get latY => throw _privateConstructorUsedError;
  @override
  int get heartCnt => throw _privateConstructorUsedError;
  @override
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'storeImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      throw _privateConstructorUsedError;
}
