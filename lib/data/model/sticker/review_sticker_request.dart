import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_sticker_request.g.dart';
part 'review_sticker_request.freezed.dart';

@freezed
class ReviewStickerRequest with _$ReviewStickerRequest {
  factory ReviewStickerRequest({
    required int reviewId,
  }) = _ReviewStickerRequest;

  factory ReviewStickerRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewStickerRequestFromJson(json);
}
