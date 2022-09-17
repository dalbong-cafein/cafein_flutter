// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congestion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CongestionResponse _$$_CongestionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CongestionResponse(
      congestionCnt: json['congestionCnt'] as int,
      congestionList: (json['resDtoList'] as List<dynamic>)
          .map((e) => Congestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CongestionResponseToJson(
        _$_CongestionResponse instance) =>
    <String, dynamic>{
      'congestionCnt': instance.congestionCnt,
      'resDtoList': instance.congestionList,
    };
