// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewListResponse<T> _$ReviewListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ReviewListResponse<T>(
      reviewCnt: json['reviewCnt'] as int,
      reviewData: (json['dtoList'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ReviewListResponseToJson<T>(
  ReviewListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'reviewCnt': instance.reviewCnt,
      'dtoList': instance.reviewData.map(toJsonT).toList(),
    };
