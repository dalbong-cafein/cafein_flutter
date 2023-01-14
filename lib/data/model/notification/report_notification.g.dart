// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportNotification _$$_ReportNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_ReportNotification(
      detailReportNoticeId: json['detailReportNoticeId'] as int?,
      reportExpiredDateTime: json['reportExpiredDateTime'] as String,
      reportCategoryName: json['reportCategoryName'] as String,
      reportedReviewResDto: ReportedReview.fromJson(
          json['reportedReviewResDto'] as Map<String, dynamic>),
      isPossibleObjection: json['isPossibleObjection'] as bool,
    );

Map<String, dynamic> _$$_ReportNotificationToJson(
        _$_ReportNotification instance) =>
    <String, dynamic>{
      'detailReportNoticeId': instance.detailReportNoticeId,
      'reportExpiredDateTime': instance.reportExpiredDateTime,
      'reportCategoryName': instance.reportCategoryName,
      'reportedReviewResDto': instance.reportedReviewResDto,
      'isPossibleObjection': instance.isPossibleObjection,
    };
