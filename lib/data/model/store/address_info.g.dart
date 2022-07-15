// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressInfo _$$_AddressInfoFromJson(Map<String, dynamic> json) =>
    _$_AddressInfo(
      cityName: json['siNm'] as String,
      districtName: json['sggNm'] as String,
      detail: json['detail'] as String,
      fullAddress: json['fullAddress'] as String,
      roadNumber: json['rnum'] as String,
      roadName: json['rnm'] as String,
    );

Map<String, dynamic> _$$_AddressInfoToJson(_$_AddressInfo instance) =>
    <String, dynamic>{
      'siNm': instance.cityName,
      'sggNm': instance.districtName,
      'detail': instance.detail,
      'fullAddress': instance.fullAddress,
      'rnum': instance.roadNumber,
      'rnm': instance.roadName,
    };
