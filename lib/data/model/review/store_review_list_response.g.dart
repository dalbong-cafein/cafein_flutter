// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_review_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreReviewListResponse _$$_StoreReviewListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StoreReviewListResponse(
      reviewList: (json['dtoList'] as List<dynamic>)
          .map((e) => StoreReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: json['totalPage'] as int,
      page: json['page'] as int,
      size: json['size'] as int,
      last: json['last'] as bool,
    );

Map<String, dynamic> _$$_StoreReviewListResponseToJson(
        _$_StoreReviewListResponse instance) =>
    <String, dynamic>{
      'dtoList': instance.reviewList,
      'totalPage': instance.totalPage,
      'page': instance.page,
      'size': instance.size,
      'last': instance.last,
    };
