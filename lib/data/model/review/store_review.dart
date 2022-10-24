import 'package:cafein_flutter/data/model/common/detail_evaluation.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_review.g.dart';
part 'store_review.freezed.dart';

@freezed
class StoreReview with _$StoreReview {
  factory StoreReview({
    required int reviewId,
    required int writerId,
    required String nicknameOfWriter,
    String? profileImageUrl,
    String? content,
    required int visitCnt,
    required String recommendation,
    required DetailEvaluation detailEvaluation,
    @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? imageIdPairs,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _StoreReview;

  factory StoreReview.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewFromJson(json);
}
