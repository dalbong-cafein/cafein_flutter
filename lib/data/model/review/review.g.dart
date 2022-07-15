// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      reviewId: json['reviewId'] as int,
      writerId: json['writerId'] as int,
      nickNameOfWriter: json['nickNameOfWriter'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      visitCnt: json['visitCnt'] as int,
      content: json['content'] as String,
      imageIdPairs: (json['reviewImageDtoList'] as List<dynamic>?)
          ?.map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'reviewId': instance.reviewId,
      'writerId': instance.writerId,
      'nickNameOfWriter': instance.nickNameOfWriter,
      'profileImageUrl': instance.profileImageUrl,
      'visitCnt': instance.visitCnt,
      'content': instance.content,
      'reviewImageDtoList': instance.imageIdPairs,
      'regDateTime': instance.registeredDateTime,
    };
