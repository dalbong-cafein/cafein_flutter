import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.g.dart';
part 'notice.freezed.dart';

@freezed
class Notice with _$Notice {
  factory Notice({
    required int noticeId,
    required String noticeType,
    required String content,
    required bool isRead,
    int? stickerId,
    int? couponId,
    int? boardId,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}
