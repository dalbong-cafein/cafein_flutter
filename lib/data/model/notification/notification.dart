import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.g.dart';
part 'notice.freezed.dart';

@freezed
class Notification with _$Notification {
  factory Notification({
    required int notificationId,
    required String noticeType,
    required String content,
    required bool isRead,
    int? stickerId,
    int? couponId,
    int? boardId,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
