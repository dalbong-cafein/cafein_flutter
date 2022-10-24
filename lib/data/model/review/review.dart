import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.g.dart';
part 'review.freezed.dart';

@freezed
class Review with _$Review {
  factory Review({
    required int reviewId,
    required int writerId,
    required String nickNameOfWriter,
    String? profileImageUrl,
    required int visitCnt,
    String? content,
    @JsonKey(name: 'reviewImageDtoList') List<ImageIdPair>? imageIdPairs,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
