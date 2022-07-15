// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      recommendPercent: json['recommendPercent'] as int,
      lngX: (json['lngX'] as num).toDouble(),
      latY: (json['latY'] as num).toDouble(),
      heartCnt: json['heartCnt'] as int,
      congestionScoreAvg: (json['congestionScoreAvg'] as num?)?.toDouble(),
      imageIdPair:
          ImageIdPair.fromJson(json['storeImageDto'] as Map<String, dynamic>),
      businessInfo: BusinessInfo.fromJson(
          json['businessHoursInfoDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'recommendPercent': instance.recommendPercent,
      'lngX': instance.lngX,
      'latY': instance.latY,
      'heartCnt': instance.heartCnt,
      'congestionScoreAvg': instance.congestionScoreAvg,
      'storeImageDto': instance.imageIdPair,
      'businessHoursInfoDto': instance.businessInfo,
    };
