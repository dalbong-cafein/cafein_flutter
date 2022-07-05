import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_review_list_response.g.dart';
part 'store_review_list_response.freezed.dart';

@freezed
class StoreReviewListResponse with _$StoreReviewListResponse {
  factory StoreReviewListResponse({
    @JsonKey(name: 'dtoList') required List<StoreReview> reviewList,
    required int totalPage,
    required int page,
    required int size,
    required bool last,
  }) = _StoreReviewListResponse;

  factory StoreReviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewListResponseFromJson(json);
}
