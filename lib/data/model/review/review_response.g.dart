// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse<T> _$ReviewResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ReviewResponse<T>(
      reviewCnt: json['reviewCnt'] as int,
      reviewData: fromJsonT(json['dtoList']),
    );

Map<String, dynamic> _$ReviewResponseToJson<T>(
  ReviewResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'reviewCnt': instance.reviewCnt,
      'dtoList': toJsonT(instance.reviewData),
    };
