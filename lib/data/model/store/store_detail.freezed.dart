// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreDetail _$StoreDetailFromJson(Map<String, dynamic> json) {
  return _StoreDetail.fromJson(json);
}

/// @nodoc
mixin _$StoreDetail {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get nicknameOfModMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'memberImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  AddressInfo get addressInfo => throw _privateConstructorUsedError;
  String get wifiPassword => throw _privateConstructorUsedError;
  int get heartCnt => throw _privateConstructorUsedError;
  bool get isHeart => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  double get lngX => throw _privateConstructorUsedError;
  double get latY => throw _privateConstructorUsedError;
  List<ImageIdPair> get reviewImageIdPairList =>
      throw _privateConstructorUsedError;
  List<ImageIdPair> get storeImageIdPairList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'totalBusinessHoursResDto')
  TotalBusinessInfo get totalBusinessInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDetailCopyWith<StoreDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailCopyWith<$Res> {
  factory $StoreDetailCopyWith(
          StoreDetail value, $Res Function(StoreDetail) then) =
      _$StoreDetailCopyWithImpl<$Res>;
  $Res call(
      {int storeId,
      String storeName,
      String nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          ImageIdPair imageIdPair,
      @JsonKey(name: 'address')
          AddressInfo addressInfo,
      String wifiPassword,
      int heartCnt,
      bool isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          BusinessInfo businessInfo,
      double lngX,
      double latY,
      List<ImageIdPair> reviewImageIdPairList,
      List<ImageIdPair> storeImageIdPairList,
      @JsonKey(name: 'totalBusinessHoursResDto')
          TotalBusinessInfo totalBusinessInfo});

  $ImageIdPairCopyWith<$Res> get imageIdPair;
  $AddressInfoCopyWith<$Res> get addressInfo;
  $BusinessInfoCopyWith<$Res> get businessInfo;
  $TotalBusinessInfoCopyWith<$Res> get totalBusinessInfo;
}

/// @nodoc
class _$StoreDetailCopyWithImpl<$Res> implements $StoreDetailCopyWith<$Res> {
  _$StoreDetailCopyWithImpl(this._value, this._then);

  final StoreDetail _value;
  // ignore: unused_field
  final $Res Function(StoreDetail) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? nicknameOfModMember = freezed,
    Object? imageIdPair = freezed,
    Object? addressInfo = freezed,
    Object? wifiPassword = freezed,
    Object? heartCnt = freezed,
    Object? isHeart = freezed,
    Object? businessInfo = freezed,
    Object? lngX = freezed,
    Object? latY = freezed,
    Object? reviewImageIdPairList = freezed,
    Object? storeImageIdPairList = freezed,
    Object? totalBusinessInfo = freezed,
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
      nicknameOfModMember: nicknameOfModMember == freezed
          ? _value.nicknameOfModMember
          : nicknameOfModMember // ignore: cast_nullable_to_non_nullable
              as String,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
      addressInfo: addressInfo == freezed
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      wifiPassword: wifiPassword == freezed
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
      heartCnt: heartCnt == freezed
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHeart: isHeart == freezed
          ? _value.isHeart
          : isHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      businessInfo: businessInfo == freezed
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      lngX: lngX == freezed
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: latY == freezed
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      reviewImageIdPairList: reviewImageIdPairList == freezed
          ? _value.reviewImageIdPairList
          : reviewImageIdPairList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      storeImageIdPairList: storeImageIdPairList == freezed
          ? _value.storeImageIdPairList
          : storeImageIdPairList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      totalBusinessInfo: totalBusinessInfo == freezed
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo,
    ));
  }

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair {
    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair, (value) {
      return _then(_value.copyWith(imageIdPair: value));
    });
  }

  @override
  $AddressInfoCopyWith<$Res> get addressInfo {
    return $AddressInfoCopyWith<$Res>(_value.addressInfo, (value) {
      return _then(_value.copyWith(addressInfo: value));
    });
  }

  @override
  $BusinessInfoCopyWith<$Res> get businessInfo {
    return $BusinessInfoCopyWith<$Res>(_value.businessInfo, (value) {
      return _then(_value.copyWith(businessInfo: value));
    });
  }

  @override
  $TotalBusinessInfoCopyWith<$Res> get totalBusinessInfo {
    return $TotalBusinessInfoCopyWith<$Res>(_value.totalBusinessInfo, (value) {
      return _then(_value.copyWith(totalBusinessInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_StoreDetailCopyWith<$Res>
    implements $StoreDetailCopyWith<$Res> {
  factory _$$_StoreDetailCopyWith(
          _$_StoreDetail value, $Res Function(_$_StoreDetail) then) =
      __$$_StoreDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int storeId,
      String storeName,
      String nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          ImageIdPair imageIdPair,
      @JsonKey(name: 'address')
          AddressInfo addressInfo,
      String wifiPassword,
      int heartCnt,
      bool isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          BusinessInfo businessInfo,
      double lngX,
      double latY,
      List<ImageIdPair> reviewImageIdPairList,
      List<ImageIdPair> storeImageIdPairList,
      @JsonKey(name: 'totalBusinessHoursResDto')
          TotalBusinessInfo totalBusinessInfo});

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair;
  @override
  $AddressInfoCopyWith<$Res> get addressInfo;
  @override
  $BusinessInfoCopyWith<$Res> get businessInfo;
  @override
  $TotalBusinessInfoCopyWith<$Res> get totalBusinessInfo;
}

/// @nodoc
class __$$_StoreDetailCopyWithImpl<$Res> extends _$StoreDetailCopyWithImpl<$Res>
    implements _$$_StoreDetailCopyWith<$Res> {
  __$$_StoreDetailCopyWithImpl(
      _$_StoreDetail _value, $Res Function(_$_StoreDetail) _then)
      : super(_value, (v) => _then(v as _$_StoreDetail));

  @override
  _$_StoreDetail get _value => super._value as _$_StoreDetail;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? nicknameOfModMember = freezed,
    Object? imageIdPair = freezed,
    Object? addressInfo = freezed,
    Object? wifiPassword = freezed,
    Object? heartCnt = freezed,
    Object? isHeart = freezed,
    Object? businessInfo = freezed,
    Object? lngX = freezed,
    Object? latY = freezed,
    Object? reviewImageIdPairList = freezed,
    Object? storeImageIdPairList = freezed,
    Object? totalBusinessInfo = freezed,
  }) {
    return _then(_$_StoreDetail(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      nicknameOfModMember: nicknameOfModMember == freezed
          ? _value.nicknameOfModMember
          : nicknameOfModMember // ignore: cast_nullable_to_non_nullable
              as String,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
      addressInfo: addressInfo == freezed
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      wifiPassword: wifiPassword == freezed
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
      heartCnt: heartCnt == freezed
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHeart: isHeart == freezed
          ? _value.isHeart
          : isHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      businessInfo: businessInfo == freezed
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      lngX: lngX == freezed
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: latY == freezed
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      reviewImageIdPairList: reviewImageIdPairList == freezed
          ? _value._reviewImageIdPairList
          : reviewImageIdPairList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      storeImageIdPairList: storeImageIdPairList == freezed
          ? _value._storeImageIdPairList
          : storeImageIdPairList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      totalBusinessInfo: totalBusinessInfo == freezed
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreDetail implements _StoreDetail {
  _$_StoreDetail(
      {required this.storeId,
      required this.storeName,
      required this.nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          required this.imageIdPair,
      @JsonKey(name: 'address')
          required this.addressInfo,
      required this.wifiPassword,
      required this.heartCnt,
      required this.isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          required this.businessInfo,
      required this.lngX,
      required this.latY,
      required final List<ImageIdPair> reviewImageIdPairList,
      required final List<ImageIdPair> storeImageIdPairList,
      @JsonKey(name: 'totalBusinessHoursResDto')
          required this.totalBusinessInfo})
      : _reviewImageIdPairList = reviewImageIdPairList,
        _storeImageIdPairList = storeImageIdPairList;

  factory _$_StoreDetail.fromJson(Map<String, dynamic> json) =>
      _$$_StoreDetailFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final String nicknameOfModMember;
  @override
  @JsonKey(name: 'memberImageDto')
  final ImageIdPair imageIdPair;
  @override
  @JsonKey(name: 'address')
  final AddressInfo addressInfo;
  @override
  final String wifiPassword;
  @override
  final int heartCnt;
  @override
  final bool isHeart;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  final BusinessInfo businessInfo;
  @override
  final double lngX;
  @override
  final double latY;
  final List<ImageIdPair> _reviewImageIdPairList;
  @override
  List<ImageIdPair> get reviewImageIdPairList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewImageIdPairList);
  }

  final List<ImageIdPair> _storeImageIdPairList;
  @override
  List<ImageIdPair> get storeImageIdPairList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeImageIdPairList);
  }

  @override
  @JsonKey(name: 'totalBusinessHoursResDto')
  final TotalBusinessInfo totalBusinessInfo;

  @override
  String toString() {
    return 'StoreDetail(storeId: $storeId, storeName: $storeName, nicknameOfModMember: $nicknameOfModMember, imageIdPair: $imageIdPair, addressInfo: $addressInfo, wifiPassword: $wifiPassword, heartCnt: $heartCnt, isHeart: $isHeart, businessInfo: $businessInfo, lngX: $lngX, latY: $latY, reviewImageIdPairList: $reviewImageIdPairList, storeImageIdPairList: $storeImageIdPairList, totalBusinessInfo: $totalBusinessInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreDetail &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality()
                .equals(other.nicknameOfModMember, nicknameOfModMember) &&
            const DeepCollectionEquality()
                .equals(other.imageIdPair, imageIdPair) &&
            const DeepCollectionEquality()
                .equals(other.addressInfo, addressInfo) &&
            const DeepCollectionEquality()
                .equals(other.wifiPassword, wifiPassword) &&
            const DeepCollectionEquality().equals(other.heartCnt, heartCnt) &&
            const DeepCollectionEquality().equals(other.isHeart, isHeart) &&
            const DeepCollectionEquality()
                .equals(other.businessInfo, businessInfo) &&
            const DeepCollectionEquality().equals(other.lngX, lngX) &&
            const DeepCollectionEquality().equals(other.latY, latY) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageIdPairList, _reviewImageIdPairList) &&
            const DeepCollectionEquality()
                .equals(other._storeImageIdPairList, _storeImageIdPairList) &&
            const DeepCollectionEquality()
                .equals(other.totalBusinessInfo, totalBusinessInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(nicknameOfModMember),
      const DeepCollectionEquality().hash(imageIdPair),
      const DeepCollectionEquality().hash(addressInfo),
      const DeepCollectionEquality().hash(wifiPassword),
      const DeepCollectionEquality().hash(heartCnt),
      const DeepCollectionEquality().hash(isHeart),
      const DeepCollectionEquality().hash(businessInfo),
      const DeepCollectionEquality().hash(lngX),
      const DeepCollectionEquality().hash(latY),
      const DeepCollectionEquality().hash(_reviewImageIdPairList),
      const DeepCollectionEquality().hash(_storeImageIdPairList),
      const DeepCollectionEquality().hash(totalBusinessInfo));

  @JsonKey(ignore: true)
  @override
  _$$_StoreDetailCopyWith<_$_StoreDetail> get copyWith =>
      __$$_StoreDetailCopyWithImpl<_$_StoreDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreDetailToJson(this);
  }
}

abstract class _StoreDetail implements StoreDetail {
  factory _StoreDetail(
      {required final int storeId,
      required final String storeName,
      required final String nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          required final ImageIdPair imageIdPair,
      @JsonKey(name: 'address')
          required final AddressInfo addressInfo,
      required final String wifiPassword,
      required final int heartCnt,
      required final bool isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          required final BusinessInfo businessInfo,
      required final double lngX,
      required final double latY,
      required final List<ImageIdPair> reviewImageIdPairList,
      required final List<ImageIdPair> storeImageIdPairList,
      @JsonKey(name: 'totalBusinessHoursResDto')
          required final TotalBusinessInfo totalBusinessInfo}) = _$_StoreDetail;

  factory _StoreDetail.fromJson(Map<String, dynamic> json) =
      _$_StoreDetail.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  String get storeName => throw _privateConstructorUsedError;
  @override
  String get nicknameOfModMember => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'memberImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'address')
  AddressInfo get addressInfo => throw _privateConstructorUsedError;
  @override
  String get wifiPassword => throw _privateConstructorUsedError;
  @override
  int get heartCnt => throw _privateConstructorUsedError;
  @override
  bool get isHeart => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  @override
  double get lngX => throw _privateConstructorUsedError;
  @override
  double get latY => throw _privateConstructorUsedError;
  @override
  List<ImageIdPair> get reviewImageIdPairList =>
      throw _privateConstructorUsedError;
  @override
  List<ImageIdPair> get storeImageIdPairList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'totalBusinessHoursResDto')
  TotalBusinessInfo get totalBusinessInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDetailCopyWith<_$_StoreDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
