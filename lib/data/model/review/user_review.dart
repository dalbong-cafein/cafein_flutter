import 'package:cafein_flutter/data/model/common/detail_evaluation.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_review.g.dart';
part 'user_review.freezed.dart';

@freezed
class UserReview with _$UserReview {
  factory UserReview({
    required int reviewId,
    required int storeId,
    required String storeName,
    String? content,
    required int visitCnt,
    required String recommendation,
    required DetailEvaluation detailEvaluation,
    @JsonKey(name: 'reviewImageDto') List<ImageIdPair>? reviewImageIdPairs,
    @JsonKey(name: 'storeImage') ImageIdPair? storeImageIdPairs,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _UserReview;

  factory UserReview.fromJson(Map<String, dynamic> json) =>
      _$UserReviewFromJson(json);
}
