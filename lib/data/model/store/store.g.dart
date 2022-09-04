// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      recommendPercent: (json['recommendPercent'] as num?)?.toDouble(),
      lngX: (json['lngX'] as num).toDouble(),
      latY: (json['latY'] as num).toDouble(),
      heartCnt: json['heartCnt'] as int,
      isHeart: json['isHeart'] as bool,
      congestionScoreAvg: (json['congestionScoreAvg'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      imageIdPair: (json['storeImageDtoList'] as List<dynamic>)
          .map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessInfo: json['businessHoursInfoDto'] == null
          ? null
          : BusinessInfo.fromJson(
              json['businessHoursInfoDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'recommendPercent': instance.recommendPercent,
      'lngX': instance.lngX,
      'latY': instance.latY,
      'heartCnt': instance.heartCnt,
      'isHeart': instance.isHeart,
      'congestionScoreAvg': instance.congestionScoreAvg,
      'distance': instance.distance,
      'storeImageDtoList': instance.imageIdPair,
      'businessHoursInfoDto': instance.businessInfo,
    };
