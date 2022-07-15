// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notice _$$_NoticeFromJson(Map<String, dynamic> json) => _$_Notice(
      noticeId: json['noticeId'] as int,
      noticeType: json['noticeType'] as String,
      content: json['content'] as String,
      isRead: json['isRead'] as bool,
      stickerId: json['stickerId'] as int?,
      couponId: json['couponId'] as int?,
      boardId: json['boardId'] as int?,
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_NoticeToJson(_$_Notice instance) => <String, dynamic>{
      'noticeId': instance.noticeId,
      'noticeType': instance.noticeType,
      'content': instance.content,
      'isRead': instance.isRead,
      'stickerId': instance.stickerId,
      'couponId': instance.couponId,
      'boardId': instance.boardId,
      'regDateTime': instance.registeredDateTime,
    };
