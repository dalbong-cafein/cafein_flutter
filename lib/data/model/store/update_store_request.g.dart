// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateStoreRequest _$$_UpdateStoreRequestFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateStoreRequest(
      storeId: json['storeId'] as int,
      phoneNumber: json['phoneNumber'] as String,
      wifiPassword: json['wifiPassword'] as String,
      webSite: json['webSite'] as String,
      updateImageFiles: (json['updateImageFiles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      deleteImageIds: (json['deleteImageIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      totalBusinessInfo: TotalBusinessInfo.fromJson(
          json['totalBusinessInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UpdateStoreRequestToJson(
        _$_UpdateStoreRequest instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'phoneNumber': instance.phoneNumber,
      'wifiPassword': instance.wifiPassword,
      'webSite': instance.webSite,
      'updateImageFiles': instance.updateImageFiles,
      'deleteImageIds': instance.deleteImageIds,
      'totalBusinessInfo': instance.totalBusinessInfo,
    };
