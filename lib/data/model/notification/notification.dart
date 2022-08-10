import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.g.dart';
part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  factory Notification({
    @JsonKey(name: 'noticeId') required int notificationId,
    @JsonKey(name: 'noticeType') required String notificationType,
    required String content,
    required bool isRead,
    int? stickerId,
    int? couponId,
    int? boardId,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
