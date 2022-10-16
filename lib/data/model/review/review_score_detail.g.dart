// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_score_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewDetailScore _$$_ReviewDetailScoreFromJson(Map<String, dynamic> json) =>
    _$_ReviewDetailScore(
      reviewCnt: json['reviewCnt'] as int,
      recommendPercent: (json['recommendPercent'] as num?)?.toDouble(),
      socket: json['socket'] as String,
      socketCnt: json['socketCnt'] as int,
      wifi: json['wifi'] as String,
      wifiCnt: json['wifiCnt'] as int,
      restroom: json['restroom'] as String,
      restroomCnt: json['restroomCnt'] as int,
      tableSize: json['tableSize'] as String,
      tableCnt: json['tableCnt'] as int,
    );

Map<String, dynamic> _$$_ReviewDetailScoreToJson(
        _$_ReviewDetailScore instance) =>
    <String, dynamic>{
      'reviewCnt': instance.reviewCnt,
      'recommendPercent': instance.recommendPercent,
      'socket': instance.socket,
      'socketCnt': instance.socketCnt,
      'wifi': instance.wifi,
      'wifiCnt': instance.wifiCnt,
      'restroom': instance.restroom,
      'restroomCnt': instance.restroomCnt,
      'tableSize': instance.tableSize,
      'tableCnt': instance.tableCnt,
    };
