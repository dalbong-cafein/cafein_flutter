import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_score_detail.g.dart';
part 'review_score_detail.freezed.dart';

@freezed
class ReviewDetailScore with _$ReviewDetailScore {
  factory ReviewDetailScore({
    required int reviewCnt,
    required double recommendPercent,
    required String socket,
    required int socketCnt,
    required String wifi,
    required int wifiCnt,
    required String restroom,
    required int restroomCnt,
    required String tableSize,
    required int tableCnt,
  }) = _ReviewDetailScore;

  factory ReviewDetailScore.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailScoreFromJson(json);
}
