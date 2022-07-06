import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_category.freezed.dart';
part 'report_category.g.dart';

@freezed
class ReportCategory with _$ReportCategory {
  factory ReportCategory({
    required int reportCategoryId,
    required String categoryName,
  }) = _ReportCategory;

  factory ReportCategory.fromJson(Map<String, dynamic> json) => _$ReportCategoryFromJson(json);
}
