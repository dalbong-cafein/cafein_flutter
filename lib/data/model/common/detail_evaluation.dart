import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_evaluation.g.dart';
part 'detail_evaluation.freezed.dart';

@freezed
class DetailEvaluation with _$DetailEvaluation {
  factory DetailEvaluation({
    required int socket,
    required int wifi,
    required int restroom,
    required int tableSize,
  }) = _DetailEvaluation;

  factory DetailEvaluation.fromJson(Map<String, dynamic> json) => _$DetailEvaluationFromJson(json);
}
