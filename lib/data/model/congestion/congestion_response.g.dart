// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congestion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CongestionResponse _$$_CongestionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CongestionResponse(
      congestionCng: json['congestionCng'] as int,
      congestionList: (json['congestionList'] as List<dynamic>)
          .map((e) => Congestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CongestionResponseToJson(
        _$_CongestionResponse instance) =>
    <String, dynamic>{
      'congestionCng': instance.congestionCng,
      'congestionList': instance.congestionList,
    };
