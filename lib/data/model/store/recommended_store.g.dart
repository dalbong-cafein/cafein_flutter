// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecommendedStore _$$_RecommendedStoreFromJson(Map<String, dynamic> json) =>
    _$_RecommendedStore(
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      addressInfo:
          AddressInfo.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RecommendedStoreToJson(_$_RecommendedStore instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'address': instance.addressInfo,
    };
