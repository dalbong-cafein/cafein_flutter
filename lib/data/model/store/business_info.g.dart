// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessInfo _$$_BusinessInfoFromJson(Map<String, dynamic> json) =>
    _$_BusinessInfo(
      isOpen: json['isOpen'] as bool? ?? false,
      closed: json['closed'] as String?,
      open: json['open'] as String?,
      nextOpen: json['nextOpen'] as String? ?? '10:00',
      holidayType: json['holidayType'] as String?,
    );

Map<String, dynamic> _$$_BusinessInfoToJson(_$_BusinessInfo instance) =>
    <String, dynamic>{
      'isOpen': instance.isOpen,
      'closed': instance.closed,
      'open': instance.open,
      'nextOpen': instance.nextOpen,
      'holidayType': instance.holidayType,
    };
