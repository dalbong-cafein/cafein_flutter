import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_possible.freezed.dart';
part 'report_possible.g.dart';

@freezed
class ReportPossible with _$ReportPossible{
  const factory ReportPossible({
    required bool isPossibleRegistration,
    required String? reason
  }) = _ReportPossible;

  factory ReportPossible.fromJson(Map<String, dynamic> json) => _$ReportPossibleFromJson(json);
}