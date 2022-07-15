// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreResponse<T> _$StoreResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    StoreResponse<T>(
      storeCnt: json['storeCnt'] as int,
      storeData: fromJsonT(json['resDtoList']),
    );

Map<String, dynamic> _$StoreResponseToJson<T>(
  StoreResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'storeCnt': instance.storeCnt,
      'resDtoList': toJsonT(instance.storeData),
    };
