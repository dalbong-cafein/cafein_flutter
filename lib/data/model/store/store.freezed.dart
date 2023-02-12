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
  double? get recommendPercent => throw _privateConstructorUsedError;
  double get lngX => throw _privateConstructorUsedError;
  double get latY => throw _privateConstructorUsedError;
  int get heartCnt => throw _privateConstructorUsedError;
  bool get isHeart => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImageDtoList')
  List<ImageIdPair>? get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo? get businessInfo => throw _privateConstructorUsedError;
  ImageIdPair? get representImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      double? recommendPercent,
      double lngX,
      double latY,
      int heartCnt,
      bool isHeart,
      double? congestionScoreAvg,
      double? distance,
      @JsonKey(name: 'storeImageDtoList') List<ImageIdPair>? imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo? businessInfo,
      ImageIdPair? representImage});

  $BusinessInfoCopyWith<$Res>? get businessInfo;
  $ImageIdPairCopyWith<$Res>? get representImage;
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? recommendPercent = freezed,
    Object? lngX = null,
    Object? latY = null,
    Object? heartCnt = null,
    Object? isHeart = null,
    Object? congestionScoreAvg = freezed,
    Object? distance = freezed,
    Object? imageIdPair = freezed,
    Object? businessInfo = freezed,
    Object? representImage = freezed,
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
      recommendPercent: freezed == recommendPercent
          ? _value.recommendPercent
          : recommendPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      lngX: null == lngX
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: null == latY
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      heartCnt: null == heartCnt
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHeart: null == isHeart
          ? _value.isHeart
          : isHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      businessInfo: freezed == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo?,
      representImage: freezed == representImage
          ? _value.representImage
          : representImage // ignore: cast_nullable_to_non_nullable
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
  $ImageIdPairCopyWith<$Res>? get representImage {
    if (_value.representImage == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.representImage!, (value) {
      return _then(_value.copyWith(representImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$_StoreCopyWith(_$_Store value, $Res Function(_$_Store) then) =
      __$$_StoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      double? recommendPercent,
      double lngX,
      double latY,
      int heartCnt,
      bool isHeart,
      double? congestionScoreAvg,
      double? distance,
      @JsonKey(name: 'storeImageDtoList') List<ImageIdPair>? imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo? businessInfo,
      ImageIdPair? representImage});

  @override
  $BusinessInfoCopyWith<$Res>? get businessInfo;
  @override
  $ImageIdPairCopyWith<$Res>? get representImage;
}

/// @nodoc
class __$$_StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res, _$_Store>
    implements _$$_StoreCopyWith<$Res> {
  __$$_StoreCopyWithImpl(_$_Store _value, $Res Function(_$_Store) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? recommendPercent = freezed,
    Object? lngX = null,
    Object? latY = null,
    Object? heartCnt = null,
    Object? isHeart = null,
    Object? congestionScoreAvg = freezed,
    Object? distance = freezed,
    Object? imageIdPair = freezed,
    Object? businessInfo = freezed,
    Object? representImage = freezed,
  }) {
    return _then(_$_Store(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      recommendPercent: freezed == recommendPercent
          ? _value.recommendPercent
          : recommendPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      lngX: null == lngX
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: null == latY
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      heartCnt: null == heartCnt
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHeart: null == isHeart
          ? _value.isHeart
          : isHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: freezed == imageIdPair
          ? _value._imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      businessInfo: freezed == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo?,
      representImage: freezed == representImage
          ? _value.representImage
          : representImage // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Store implements _Store {
  _$_Store(
      {required this.storeId,
      required this.storeName,
      this.recommendPercent,
      required this.lngX,
      required this.latY,
      required this.heartCnt,
      required this.isHeart,
      this.congestionScoreAvg,
      this.distance,
      @JsonKey(name: 'storeImageDtoList') final List<ImageIdPair>? imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') this.businessInfo,
      required this.representImage})
      : _imageIdPair = imageIdPair;

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$$_StoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final double? recommendPercent;
  @override
  final double lngX;
  @override
  final double latY;
  @override
  final int heartCnt;
  @override
  final bool isHeart;
  @override
  final double? congestionScoreAvg;
  @override
  final double? distance;
  final List<ImageIdPair>? _imageIdPair;
  @override
  @JsonKey(name: 'storeImageDtoList')
  List<ImageIdPair>? get imageIdPair {
    final value = _imageIdPair;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'businessHoursInfoDto')
  final BusinessInfo? businessInfo;
  @override
  final ImageIdPair? representImage;

  @override
  String toString() {
    return 'Store(storeId: $storeId, storeName: $storeName, recommendPercent: $recommendPercent, lngX: $lngX, latY: $latY, heartCnt: $heartCnt, isHeart: $isHeart, congestionScoreAvg: $congestionScoreAvg, distance: $distance, imageIdPair: $imageIdPair, businessInfo: $businessInfo, representImage: $representImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Store &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.recommendPercent, recommendPercent) ||
                other.recommendPercent == recommendPercent) &&
            (identical(other.lngX, lngX) || other.lngX == lngX) &&
            (identical(other.latY, latY) || other.latY == latY) &&
            (identical(other.heartCnt, heartCnt) ||
                other.heartCnt == heartCnt) &&
            (identical(other.isHeart, isHeart) || other.isHeart == isHeart) &&
            (identical(other.congestionScoreAvg, congestionScoreAvg) ||
                other.congestionScoreAvg == congestionScoreAvg) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality()
                .equals(other._imageIdPair, _imageIdPair) &&
            (identical(other.businessInfo, businessInfo) ||
                other.businessInfo == businessInfo) &&
            (identical(other.representImage, representImage) ||
                other.representImage == representImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeId,
      storeName,
      recommendPercent,
      lngX,
      latY,
      heartCnt,
      isHeart,
      congestionScoreAvg,
      distance,
      const DeepCollectionEquality().hash(_imageIdPair),
      businessInfo,
      representImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      __$$_StoreCopyWithImpl<_$_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreToJson(
      this,
    );
  }
}

abstract class _Store implements Store {
  factory _Store(
      {required final int storeId,
      required final String storeName,
      final double? recommendPercent,
      required final double lngX,
      required final double latY,
      required final int heartCnt,
      required final bool isHeart,
      final double? congestionScoreAvg,
      final double? distance,
      @JsonKey(name: 'storeImageDtoList') final List<ImageIdPair>? imageIdPair,
      @JsonKey(name: 'businessHoursInfoDto') final BusinessInfo? businessInfo,
      required final ImageIdPair? representImage}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  int get storeId;
  @override
  String get storeName;
  @override
  double? get recommendPercent;
  @override
  double get lngX;
  @override
  double get latY;
  @override
  int get heartCnt;
  @override
  bool get isHeart;
  @override
  double? get congestionScoreAvg;
  @override
  double? get distance;
  @override
  @JsonKey(name: 'storeImageDtoList')
  List<ImageIdPair>? get imageIdPair;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo? get businessInfo;
  @override
  ImageIdPair? get representImage;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      throw _privateConstructorUsedError;
}
