// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportedReview _$$_ReportedReviewFromJson(Map<String, dynamic> json) =>
    _$_ReportedReview(
      reviewId: json['reviewId'] as int,
      content: json['content'] as String,
      recommendation: json['recommendation'] as String,
      detailEvaluation: json['detailEvaluation'] == null
          ? null
          : DetailEvaluation.fromJson(
              json['detailEvaluation'] as Map<String, dynamic>),
      reviewImageIdPairs: (json['reviewImageDtoList'] as List<dynamic>?)
          ?.map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      regDateTime: json['regDateTime'] as String,
      stopPostDateTime: json['stopPostDateTime'] as String,
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      storeImageDto: json['storeImageDto'] == null
          ? null
          : ImageIdPair.fromJson(json['storeImageDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReportedReviewToJson(_$_ReportedReview instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'content': instance.content,
      'recommendation': instance.recommendation,
      'detailEvaluation': instance.detailEvaluation,
      'reviewImageDtoList': instance.reviewImageIdPairs,
      'regDateTime': instance.regDateTime,
      'stopPostDateTime': instance.stopPostDateTime,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'storeImageDto': instance.storeImageDto,
    };
