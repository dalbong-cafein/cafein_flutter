// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportRequest _$$_ReportRequestFromJson(Map<String, dynamic> json) =>
    _$_ReportRequest(
      reviewId: json['reviewId'] as int,
      reportCategoryId: json['reportCategoryId'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_ReportRequestToJson(_$_ReportRequest instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'reportCategoryId': instance.reportCategoryId,
      'content': instance.content,
    };
