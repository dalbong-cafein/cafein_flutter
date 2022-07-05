import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_review_request.freezed.dart';

@freezed
class UpdateReviewRequest with _$UpdateReviewRequest {
  factory UpdateReviewRequest({
    required int reviewId,
    required String recommendation,
    required String content,
    required String socket,
    required String wifi,
    required String restroom,
    required String tableSize,
    List<String>? updateImageFiles,
    List<int>? deleteImageIds,
  }) = _UpdateReviewRequest;
}
