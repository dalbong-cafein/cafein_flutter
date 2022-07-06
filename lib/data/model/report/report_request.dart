import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_request.g.dart';
part 'report_request.freezed.dart';

@freezed
class ReportRequest with _$ReportRequest {
  factory ReportRequest({
    required int reviewId,
    required int reportCategoryId,
    required String content,
  }) = _ReportRequest;

  factory ReportRequest.fromJson(Map<String, dynamic> json) => _$ReportRequestFromJson(json);
}
