// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreDetail _$$_StoreDetailFromJson(Map<String, dynamic> json) =>
    _$_StoreDetail(
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      nicknameOfModMember: json['nicknameOfModMember'] as String,
      imageIdPair: json['memberImageDto'] == null
          ? null
          : ImageIdPair.fromJson(
              json['memberImageDto'] as Map<String, dynamic>),
      addressInfo:
          AddressInfo.fromJson(json['address'] as Map<String, dynamic>),
      wifiPassword: json['wifiPassword'] as String?,
      heartCnt: json['heartCnt'] as int,
      isHeart: json['isHeart'] as bool,
      businessInfo: BusinessInfo.fromJson(
          json['businessHoursInfoDto'] as Map<String, dynamic>),
      lngX: (json['lngX'] as num).toDouble(),
      latY: (json['latY'] as num).toDouble(),
      reviewImageList: (json['reviewImageList'] as List<dynamic>)
          .map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      storeImageList: (json['storeImageList'] as List<dynamic>)
          .map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBusinessInfo: json['totalBusinessHoursResDto'] == null
          ? null
          : TotalBusinessInfo.fromJson(
              json['totalBusinessHoursResDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreDetailToJson(_$_StoreDetail instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'nicknameOfModMember': instance.nicknameOfModMember,
      'memberImageDto': instance.imageIdPair,
      'address': instance.addressInfo,
      'wifiPassword': instance.wifiPassword,
      'heartCnt': instance.heartCnt,
      'isHeart': instance.isHeart,
      'businessHoursInfoDto': instance.businessInfo,
      'lngX': instance.lngX,
      'latY': instance.latY,
      'reviewImageList': instance.reviewImageList,
      'storeImageList': instance.storeImageList,
      'totalBusinessHoursResDto': instance.totalBusinessInfo,
    };
