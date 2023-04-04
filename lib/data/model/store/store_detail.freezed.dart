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
  String? get nicknameOfModMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'memberImageDto')
  ImageIdPair? get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  AddressInfo get addressInfo => throw _privateConstructorUsedError;
  String? get wifiPassword => throw _privateConstructorUsedError;
  int get heartCnt => throw _privateConstructorUsedError;
  bool get isHeart => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  double get lngX => throw _privateConstructorUsedError;
  double get latY => throw _privateConstructorUsedError;
  List<ImageIdPair> get reviewImageList => throw _privateConstructorUsedError;
  List<ImageIdPair> get storeImageList => throw _privateConstructorUsedError;
  ImageIdPair? get representImage => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalBusinessHoursResDto')
  TotalBusinessInfo? get totalBusinessInfo =>
      throw _privateConstructorUsedError;
  String get regDateTime => throw _privateConstructorUsedError;
  String get modDateTime => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDetailCopyWith<StoreDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailCopyWith<$Res> {
  factory $StoreDetailCopyWith(
          StoreDetail value, $Res Function(StoreDetail) then) =
      _$StoreDetailCopyWithImpl<$Res, StoreDetail>;
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      String? nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          ImageIdPair? imageIdPair,
      @JsonKey(name: 'address')
          AddressInfo addressInfo,
      String? wifiPassword,
      int heartCnt,
      bool isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          BusinessInfo businessInfo,
      double lngX,
      double latY,
      List<ImageIdPair> reviewImageList,
      List<ImageIdPair> storeImageList,
      ImageIdPair? representImage,
      double? congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto')
          TotalBusinessInfo? totalBusinessInfo,
      String regDateTime,
      String modDateTime,
      String? phone,
      String? website});

  $ImageIdPairCopyWith<$Res>? get imageIdPair;
  $AddressInfoCopyWith<$Res> get addressInfo;
  $BusinessInfoCopyWith<$Res> get businessInfo;
  $ImageIdPairCopyWith<$Res>? get representImage;
  $TotalBusinessInfoCopyWith<$Res>? get totalBusinessInfo;
}

/// @nodoc
class _$StoreDetailCopyWithImpl<$Res, $Val extends StoreDetail>
    implements $StoreDetailCopyWith<$Res> {
  _$StoreDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? nicknameOfModMember = freezed,
    Object? imageIdPair = freezed,
    Object? addressInfo = null,
    Object? wifiPassword = freezed,
    Object? heartCnt = null,
    Object? isHeart = null,
    Object? businessInfo = null,
    Object? lngX = null,
    Object? latY = null,
    Object? reviewImageList = null,
    Object? storeImageList = null,
    Object? representImage = freezed,
    Object? congestionScoreAvg = freezed,
    Object? totalBusinessInfo = freezed,
    Object? regDateTime = null,
    Object? modDateTime = null,
    Object? phone = freezed,
    Object? website = freezed,
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
      nicknameOfModMember: freezed == nicknameOfModMember
          ? _value.nicknameOfModMember
          : nicknameOfModMember // ignore: cast_nullable_to_non_nullable
              as String?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      addressInfo: null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      wifiPassword: freezed == wifiPassword
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      heartCnt: null == heartCnt
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHeart: null == isHeart
          ? _value.isHeart
          : isHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      businessInfo: null == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      lngX: null == lngX
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: null == latY
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      reviewImageList: null == reviewImageList
          ? _value.reviewImageList
          : reviewImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      storeImageList: null == storeImageList
          ? _value.storeImageList
          : storeImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      representImage: freezed == representImage
          ? _value.representImage
          : representImage // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBusinessInfo: freezed == totalBusinessInfo
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo?,
      regDateTime: null == regDateTime
          ? _value.regDateTime
          : regDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      modDateTime: null == modDateTime
          ? _value.modDateTime
          : modDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $AddressInfoCopyWith<$Res> get addressInfo {
    return $AddressInfoCopyWith<$Res>(_value.addressInfo, (value) {
      return _then(_value.copyWith(addressInfo: value) as $Val);
    });
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
  $ImageIdPairCopyWith<$Res>? get representImage {
    if (_value.representImage == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.representImage!, (value) {
      return _then(_value.copyWith(representImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalBusinessInfoCopyWith<$Res>? get totalBusinessInfo {
    if (_value.totalBusinessInfo == null) {
      return null;
    }

    return $TotalBusinessInfoCopyWith<$Res>(_value.totalBusinessInfo!, (value) {
      return _then(_value.copyWith(totalBusinessInfo: value) as $Val);
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
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      String? nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          ImageIdPair? imageIdPair,
      @JsonKey(name: 'address')
          AddressInfo addressInfo,
      String? wifiPassword,
      int heartCnt,
      bool isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          BusinessInfo businessInfo,
      double lngX,
      double latY,
      List<ImageIdPair> reviewImageList,
      List<ImageIdPair> storeImageList,
      ImageIdPair? representImage,
      double? congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto')
          TotalBusinessInfo? totalBusinessInfo,
      String regDateTime,
      String modDateTime,
      String? phone,
      String? website});

  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
  @override
  $AddressInfoCopyWith<$Res> get addressInfo;
  @override
  $BusinessInfoCopyWith<$Res> get businessInfo;
  @override
  $ImageIdPairCopyWith<$Res>? get representImage;
  @override
  $TotalBusinessInfoCopyWith<$Res>? get totalBusinessInfo;
}

/// @nodoc
class __$$_StoreDetailCopyWithImpl<$Res>
    extends _$StoreDetailCopyWithImpl<$Res, _$_StoreDetail>
    implements _$$_StoreDetailCopyWith<$Res> {
  __$$_StoreDetailCopyWithImpl(
      _$_StoreDetail _value, $Res Function(_$_StoreDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? nicknameOfModMember = freezed,
    Object? imageIdPair = freezed,
    Object? addressInfo = null,
    Object? wifiPassword = freezed,
    Object? heartCnt = null,
    Object? isHeart = null,
    Object? businessInfo = null,
    Object? lngX = null,
    Object? latY = null,
    Object? reviewImageList = null,
    Object? storeImageList = null,
    Object? representImage = freezed,
    Object? congestionScoreAvg = freezed,
    Object? totalBusinessInfo = freezed,
    Object? regDateTime = null,
    Object? modDateTime = null,
    Object? phone = freezed,
    Object? website = freezed,
  }) {
    return _then(_$_StoreDetail(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      nicknameOfModMember: freezed == nicknameOfModMember
          ? _value.nicknameOfModMember
          : nicknameOfModMember // ignore: cast_nullable_to_non_nullable
              as String?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      addressInfo: null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      wifiPassword: freezed == wifiPassword
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      heartCnt: null == heartCnt
          ? _value.heartCnt
          : heartCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHeart: null == isHeart
          ? _value.isHeart
          : isHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      businessInfo: null == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      lngX: null == lngX
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: null == latY
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      reviewImageList: null == reviewImageList
          ? _value._reviewImageList
          : reviewImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      storeImageList: null == storeImageList
          ? _value._storeImageList
          : storeImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      representImage: freezed == representImage
          ? _value.representImage
          : representImage // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      congestionScoreAvg: freezed == congestionScoreAvg
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBusinessInfo: freezed == totalBusinessInfo
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo?,
      regDateTime: null == regDateTime
          ? _value.regDateTime
          : regDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      modDateTime: null == modDateTime
          ? _value.modDateTime
          : modDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreDetail implements _StoreDetail {
  _$_StoreDetail(
      {required this.storeId,
      required this.storeName,
      this.nicknameOfModMember,
      @JsonKey(name: 'memberImageDto') this.imageIdPair,
      @JsonKey(name: 'address') required this.addressInfo,
      this.wifiPassword,
      required this.heartCnt,
      required this.isHeart,
      @JsonKey(name: 'businessHoursInfoDto') required this.businessInfo,
      required this.lngX,
      required this.latY,
      required final List<ImageIdPair> reviewImageList,
      required final List<ImageIdPair> storeImageList,
      this.representImage,
      this.congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto') this.totalBusinessInfo,
      required this.regDateTime,
      required this.modDateTime,
      this.phone,
      this.website})
      : _reviewImageList = reviewImageList,
        _storeImageList = storeImageList;

  factory _$_StoreDetail.fromJson(Map<String, dynamic> json) =>
      _$$_StoreDetailFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final String? nicknameOfModMember;
  @override
  @JsonKey(name: 'memberImageDto')
  final ImageIdPair? imageIdPair;
  @override
  @JsonKey(name: 'address')
  final AddressInfo addressInfo;
  @override
  final String? wifiPassword;
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
  final List<ImageIdPair> _reviewImageList;
  @override
  List<ImageIdPair> get reviewImageList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewImageList);
  }

  final List<ImageIdPair> _storeImageList;
  @override
  List<ImageIdPair> get storeImageList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeImageList);
  }

  @override
  final ImageIdPair? representImage;
  @override
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'totalBusinessHoursResDto')
  final TotalBusinessInfo? totalBusinessInfo;
  @override
  final String regDateTime;
  @override
  final String modDateTime;
  @override
  final String? phone;
  @override
  final String? website;

  @override
  String toString() {
    return 'StoreDetail(storeId: $storeId, storeName: $storeName, nicknameOfModMember: $nicknameOfModMember, imageIdPair: $imageIdPair, addressInfo: $addressInfo, wifiPassword: $wifiPassword, heartCnt: $heartCnt, isHeart: $isHeart, businessInfo: $businessInfo, lngX: $lngX, latY: $latY, reviewImageList: $reviewImageList, storeImageList: $storeImageList, representImage: $representImage, congestionScoreAvg: $congestionScoreAvg, totalBusinessInfo: $totalBusinessInfo, regDateTime: $regDateTime, modDateTime: $modDateTime, phone: $phone, website: $website)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreDetail &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.nicknameOfModMember, nicknameOfModMember) ||
                other.nicknameOfModMember == nicknameOfModMember) &&
            (identical(other.imageIdPair, imageIdPair) ||
                other.imageIdPair == imageIdPair) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo) &&
            (identical(other.wifiPassword, wifiPassword) ||
                other.wifiPassword == wifiPassword) &&
            (identical(other.heartCnt, heartCnt) ||
                other.heartCnt == heartCnt) &&
            (identical(other.isHeart, isHeart) || other.isHeart == isHeart) &&
            (identical(other.businessInfo, businessInfo) ||
                other.businessInfo == businessInfo) &&
            (identical(other.lngX, lngX) || other.lngX == lngX) &&
            (identical(other.latY, latY) || other.latY == latY) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageList, _reviewImageList) &&
            const DeepCollectionEquality()
                .equals(other._storeImageList, _storeImageList) &&
            (identical(other.representImage, representImage) ||
                other.representImage == representImage) &&
            (identical(other.congestionScoreAvg, congestionScoreAvg) ||
                other.congestionScoreAvg == congestionScoreAvg) &&
            (identical(other.totalBusinessInfo, totalBusinessInfo) ||
                other.totalBusinessInfo == totalBusinessInfo) &&
            (identical(other.regDateTime, regDateTime) ||
                other.regDateTime == regDateTime) &&
            (identical(other.modDateTime, modDateTime) ||
                other.modDateTime == modDateTime) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        storeId,
        storeName,
        nicknameOfModMember,
        imageIdPair,
        addressInfo,
        wifiPassword,
        heartCnt,
        isHeart,
        businessInfo,
        lngX,
        latY,
        const DeepCollectionEquality().hash(_reviewImageList),
        const DeepCollectionEquality().hash(_storeImageList),
        representImage,
        congestionScoreAvg,
        totalBusinessInfo,
        regDateTime,
        modDateTime,
        phone,
        website
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreDetailCopyWith<_$_StoreDetail> get copyWith =>
      __$$_StoreDetailCopyWithImpl<_$_StoreDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreDetailToJson(
      this,
    );
  }
}

abstract class _StoreDetail implements StoreDetail {
  factory _StoreDetail(
      {required final int storeId,
      required final String storeName,
      final String? nicknameOfModMember,
      @JsonKey(name: 'memberImageDto')
          final ImageIdPair? imageIdPair,
      @JsonKey(name: 'address')
          required final AddressInfo addressInfo,
      final String? wifiPassword,
      required final int heartCnt,
      required final bool isHeart,
      @JsonKey(name: 'businessHoursInfoDto')
          required final BusinessInfo businessInfo,
      required final double lngX,
      required final double latY,
      required final List<ImageIdPair> reviewImageList,
      required final List<ImageIdPair> storeImageList,
      final ImageIdPair? representImage,
      final double? congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto')
          final TotalBusinessInfo? totalBusinessInfo,
      required final String regDateTime,
      required final String modDateTime,
      final String? phone,
      final String? website}) = _$_StoreDetail;

  factory _StoreDetail.fromJson(Map<String, dynamic> json) =
      _$_StoreDetail.fromJson;

  @override
  int get storeId;
  @override
  String get storeName;
  @override
  String? get nicknameOfModMember;
  @override
  @JsonKey(name: 'memberImageDto')
  ImageIdPair? get imageIdPair;
  @override
  @JsonKey(name: 'address')
  AddressInfo get addressInfo;
  @override
  String? get wifiPassword;
  @override
  int get heartCnt;
  @override
  bool get isHeart;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo;
  @override
  double get lngX;
  @override
  double get latY;
  @override
  List<ImageIdPair> get reviewImageList;
  @override
  List<ImageIdPair> get storeImageList;
  @override
  ImageIdPair? get representImage;
  @override
  double? get congestionScoreAvg;
  @override
  @JsonKey(name: 'totalBusinessHoursResDto')
  TotalBusinessInfo? get totalBusinessInfo;
  @override
  String get regDateTime;
  @override
  String get modDateTime;
  @override
  String? get phone;
  @override
  String? get website;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDetailCopyWith<_$_StoreDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
