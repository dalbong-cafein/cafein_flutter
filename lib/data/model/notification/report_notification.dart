import 'package:cafein_flutter/data/model/review/reported_review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_notification.freezed.dart';
part 'report_notification.g.dart';

@freezed
class ReportNotification with _$ReportNotification{
  factory ReportNotification({
    required int detailReportNoticeId,
    required String reportExpiredDateTime,
    required String reportCategoryName,
    @JsonKey(name : 'reportedReviewResDto') ReportedReview? reportedReviewResDto,
    required bool isPossibleObjection
  }) = _ReportNotification;

  factory ReportNotification.fromJson(Map<String, dynamic> json) => _$ReportNotificationFromJson(json);
}