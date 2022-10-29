// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReview _$$_UserReviewFromJson(Map<String, dynamic> json) =>
    _$_UserReview(
      reviewId: json['reviewId'] as int,
      storeId: json['storeId'] as int,
      storeName: json['storeName'] as String,
      content: json['content'] as String?,
      visitCnt: json['visitCnt'] as int,
      recommendation: json['recommendation'] as String,
      detailEvaluation: DetailEvaluation.fromJson(
          json['detailEvaluation'] as Map<String, dynamic>),
      reviewImageIdPairs: (json['reviewImageDto'] as List<dynamic>?)
          ?.map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      storeImageIdPairs: json['storeImage'] == null
          ? null
          : ImageIdPair.fromJson(json['storeImage'] as Map<String, dynamic>),
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_UserReviewToJson(_$_UserReview instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'content': instance.content,
      'visitCnt': instance.visitCnt,
      'recommendation': instance.recommendation,
      'detailEvaluation': instance.detailEvaluation,
      'reviewImageDto': instance.reviewImageIdPairs,
      'storeImage': instance.storeImageIdPairs,
      'regDateTime': instance.registeredDateTime,
    };
