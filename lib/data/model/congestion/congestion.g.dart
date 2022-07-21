// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Congestion _$$_CongestionFromJson(Map<String, dynamic> json) =>
    _$_Congestion(
      writerId: json['writerId'] as int,
      nicknameOfWriter: json['nicknameOfWriter'] as String,
      congestionScore: json['congestionScore'] as int,
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_CongestionToJson(_$_Congestion instance) =>
    <String, dynamic>{
      'writerId': instance.writerId,
      'nicknameOfWriter': instance.nicknameOfWriter,
      'congestionScore': instance.congestionScore,
      'regDateTime': instance.registeredDateTime,
    };
