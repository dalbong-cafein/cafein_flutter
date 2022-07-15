// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisteredStore _$$_RegisteredStoreFromJson(Map<String, dynamic> json) =>
    _$_RegisteredStore(
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      businessInfo: BusinessInfo.fromJson(
          json['businessHoursInfoDto'] as Map<String, dynamic>),
      congestionScoreAvg: (json['congestionScoreAvg'] as num?)?.toDouble(),
      imageIdPair:
          ImageIdPair.fromJson(json['storeImageDto'] as Map<String, dynamic>),
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_RegisteredStoreToJson(_$_RegisteredStore instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'businessHoursInfoDto': instance.businessInfo,
      'congestionScoreAvg': instance.congestionScoreAvg,
      'storeImageDto': instance.imageIdPair,
      'regDateTime': instance.registeredDateTime,
    };
