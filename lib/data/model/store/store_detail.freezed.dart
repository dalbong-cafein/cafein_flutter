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
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalBusinessHoursResDto')
  TotalBusinessInfo? get totalBusinessInfo =>
      throw _privateConstructorUsedError;
  String get regDateTime => throw _privateConstructorUsedError;
  String get modDateTime => throw _privateConstructorUsedError;

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
      double? congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto')
          TotalBusinessInfo? totalBusinessInfo,
      String regDateTime,
      String modDateTime});

  $ImageIdPairCopyWith<$Res>? get imageIdPair;
  $AddressInfoCopyWith<$Res> get addressInfo;
  $BusinessInfoCopyWith<$Res> get businessInfo;
  $TotalBusinessInfoCopyWith<$Res>? get totalBusinessInfo;
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
    Object? reviewImageList = freezed,
    Object? storeImageList = freezed,
    Object? congestionScoreAvg = freezed,
    Object? totalBusinessInfo = freezed,
    Object? regDateTime = freezed,
    Object? modDateTime = freezed,
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
              as ImageIdPair?,
      addressInfo: addressInfo == freezed
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      wifiPassword: wifiPassword == freezed
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String?,
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
      reviewImageList: reviewImageList == freezed
          ? _value.reviewImageList
          : reviewImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      storeImageList: storeImageList == freezed
          ? _value.storeImageList
          : storeImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBusinessInfo: totalBusinessInfo == freezed
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo?,
      regDateTime: regDateTime == freezed
          ? _value.regDateTime
          : regDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      modDateTime: modDateTime == freezed
          ? _value.modDateTime
          : modDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair {
    if (_value.imageIdPair == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair!, (value) {
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
  $TotalBusinessInfoCopyWith<$Res>? get totalBusinessInfo {
    if (_value.totalBusinessInfo == null) {
      return null;
    }

    return $TotalBusinessInfoCopyWith<$Res>(_value.totalBusinessInfo!, (value) {
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
      double? congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto')
          TotalBusinessInfo? totalBusinessInfo,
      String regDateTime,
      String modDateTime});

  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
  @override
  $AddressInfoCopyWith<$Res> get addressInfo;
  @override
  $BusinessInfoCopyWith<$Res> get businessInfo;
  @override
  $TotalBusinessInfoCopyWith<$Res>? get totalBusinessInfo;
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
    Object? reviewImageList = freezed,
    Object? storeImageList = freezed,
    Object? congestionScoreAvg = freezed,
    Object? totalBusinessInfo = freezed,
    Object? regDateTime = freezed,
    Object? modDateTime = freezed,
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
              as ImageIdPair?,
      addressInfo: addressInfo == freezed
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      wifiPassword: wifiPassword == freezed
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String?,
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
      reviewImageList: reviewImageList == freezed
          ? _value._reviewImageList
          : reviewImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      storeImageList: storeImageList == freezed
          ? _value._storeImageList
          : storeImageList // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBusinessInfo: totalBusinessInfo == freezed
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo?,
      regDateTime: regDateTime == freezed
          ? _value.regDateTime
          : regDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      modDateTime: modDateTime == freezed
          ? _value.modDateTime
          : modDateTime // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto') this.totalBusinessInfo,
      required this.regDateTime,
      required this.modDateTime})
      : _reviewImageList = reviewImageList,
        _storeImageList = storeImageList;

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
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'totalBusinessHoursResDto')
  final TotalBusinessInfo? totalBusinessInfo;
  @override
  final String regDateTime;
  @override
  final String modDateTime;

  @override
  String toString() {
    return 'StoreDetail(storeId: $storeId, storeName: $storeName, nicknameOfModMember: $nicknameOfModMember, imageIdPair: $imageIdPair, addressInfo: $addressInfo, wifiPassword: $wifiPassword, heartCnt: $heartCnt, isHeart: $isHeart, businessInfo: $businessInfo, lngX: $lngX, latY: $latY, reviewImageList: $reviewImageList, storeImageList: $storeImageList, congestionScoreAvg: $congestionScoreAvg, totalBusinessInfo: $totalBusinessInfo, regDateTime: $regDateTime, modDateTime: $modDateTime)';
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
                .equals(other._reviewImageList, _reviewImageList) &&
            const DeepCollectionEquality()
                .equals(other._storeImageList, _storeImageList) &&
            const DeepCollectionEquality()
                .equals(other.congestionScoreAvg, congestionScoreAvg) &&
            const DeepCollectionEquality()
                .equals(other.totalBusinessInfo, totalBusinessInfo) &&
            const DeepCollectionEquality()
                .equals(other.regDateTime, regDateTime) &&
            const DeepCollectionEquality()
                .equals(other.modDateTime, modDateTime));
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
      const DeepCollectionEquality().hash(_reviewImageList),
      const DeepCollectionEquality().hash(_storeImageList),
      const DeepCollectionEquality().hash(congestionScoreAvg),
      const DeepCollectionEquality().hash(totalBusinessInfo),
      const DeepCollectionEquality().hash(regDateTime),
      const DeepCollectionEquality().hash(modDateTime));

  @JsonKey(ignore: true)
  @override
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
      required final String nicknameOfModMember,
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
      final double? congestionScoreAvg,
      @JsonKey(name: 'totalBusinessHoursResDto')
          final TotalBusinessInfo? totalBusinessInfo,
      required final String regDateTime,
      required final String modDateTime}) = _$_StoreDetail;

  factory _StoreDetail.fromJson(Map<String, dynamic> json) =
      _$_StoreDetail.fromJson;

  @override
  int get storeId;
  @override
  String get storeName;
  @override
  String get nicknameOfModMember;
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
  double? get congestionScoreAvg;
  @override
  @JsonKey(name: 'totalBusinessHoursResDto')
  TotalBusinessInfo? get totalBusinessInfo;
  @override
  String get regDateTime;
  @override
  String get modDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDetailCopyWith<_$_StoreDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
