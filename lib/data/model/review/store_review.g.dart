// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreReview _$$_StoreReviewFromJson(Map<String, dynamic> json) =>
    _$_StoreReview(
      reviewId: json['reviewId'] as int,
      writerId: json['writerId'] as int,
      nicknameOfWriter: json['nicknameOfWriter'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      content: json['content'] as String?,
      visitCnt: json['visitCnt'] as int,
      recommendation: json['recommendation'] as String,
      detailEvaluation: DetailEvaluation.fromJson(
          json['detailEvaluation'] as Map<String, dynamic>),
      imageIdPairs: (json['reviewImageDtoList'] as List<dynamic>?)
          ?.map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_StoreReviewToJson(_$_StoreReview instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'writerId': instance.writerId,
      'nicknameOfWriter': instance.nicknameOfWriter,
      'profileImageUrl': instance.profileImageUrl,
      'content': instance.content,
      'visitCnt': instance.visitCnt,
      'recommendation': instance.recommendation,
      'detailEvaluation': instance.detailEvaluation,
      'reviewImageDtoList': instance.imageIdPairs,
      'regDateTime': instance.registeredDateTime,
    };
