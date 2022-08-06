// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      notificationId: json['notificationId'] as int,
      noticeType: json['noticeType'] as String,
      content: json['content'] as String,
      isRead: json['isRead'] as bool,
      stickerId: json['stickerId'] as int?,
      couponId: json['couponId'] as int?,
      boardId: json['boardId'] as int?,
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'noticeType': instance.noticeType,
      'content': instance.content,
      'isRead': instance.isRead,
      'stickerId': instance.stickerId,
      'couponId': instance.couponId,
      'boardId': instance.boardId,
      'regDateTime': instance.registeredDateTime,
    };
