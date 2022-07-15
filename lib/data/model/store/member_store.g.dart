// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberStore _$$_MemberStoreFromJson(Map<String, dynamic> json) =>
    _$_MemberStore(
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      lngX: (json['lngX'] as num).toDouble(),
      latY: (json['latY'] as num).toDouble(),
      congestionScoreAvg: (json['congestionScoreAvg'] as num?)?.toDouble(),
      imageIdPair:
          ImageIdPair.fromJson(json['storeImageDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MemberStoreToJson(_$_MemberStore instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'lngX': instance.lngX,
      'latY': instance.latY,
      'congestionScoreAvg': instance.congestionScoreAvg,
      'storeImageDto': instance.imageIdPair,
    };
