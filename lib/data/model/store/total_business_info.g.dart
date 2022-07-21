// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_business_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TotalBusinessInfo _$$_TotalBusinessInfoFromJson(Map<String, dynamic> json) =>
    _$_TotalBusinessInfo(
      onMonday: BusinessInfo.fromJson(json['onMon'] as Map<String, dynamic>),
      onTuesday: BusinessInfo.fromJson(json['onTue'] as Map<String, dynamic>),
      onWednesday: BusinessInfo.fromJson(json['onWed'] as Map<String, dynamic>),
      onThursday: BusinessInfo.fromJson(json['onThe'] as Map<String, dynamic>),
      onFriday: BusinessInfo.fromJson(json['onFri'] as Map<String, dynamic>),
      onSaturday: BusinessInfo.fromJson(json['onSat'] as Map<String, dynamic>),
      onSunday: json['onSun'] == null
          ? null
          : BusinessInfo.fromJson(json['onSun'] as Map<String, dynamic>),
      etcTime: json['etcTime'] as String,
    );

Map<String, dynamic> _$$_TotalBusinessInfoToJson(
        _$_TotalBusinessInfo instance) =>
    <String, dynamic>{
      'onMon': instance.onMonday,
      'onTue': instance.onTuesday,
      'onWed': instance.onWednesday,
      'onThe': instance.onThursday,
      'onFri': instance.onFriday,
      'onSat': instance.onSaturday,
      'onSun': instance.onSunday,
      'etcTime': instance.etcTime,
    };
