import 'package:cafein_flutter/data/model/common/detail_evaluation.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reported_review.freezed.dart';
part 'reported_review.g.dart';

@freezed
class ReportedReview with _$ReportedReview{
  factory ReportedReview({
    required int reviewId,
    required String content,
    required String recommendation,
    required DetailEvaluation? detailEvaluation,
    @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? reviewImageIdPairs,
    required String regDateTime,
    required String stopPostDateTime,
    required int storeId,
    required String storeName,
    required ImageIdPair storeImageDto
  }) = _ReportedReview;

  factory ReportedReview.fromJson(Map<String, dynamic> json) => _$ReportedReviewFromJson(json);
}