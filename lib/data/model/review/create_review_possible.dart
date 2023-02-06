import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_review_possible.freezed.dart';
part 'create_review_possible.g.dart';

@freezed
class CreateReviewPossible with _$CreateReviewPossible {
  factory CreateReviewPossible({
    required bool isPossibleRegistration,
    required String reason
  }) = _CreateReviewPossible;

  factory CreateReviewPossible.fromJson(Map<String, dynamic> json) => _$CreateReviewPossibleFromJson(json);
}