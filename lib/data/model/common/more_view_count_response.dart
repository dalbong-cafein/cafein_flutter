import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_view_count_response.g.dart';
part 'more_view_count_response.freezed.dart';

@freezed
class MoreViewCountResponse with _$MoreViewCountResponse {
  factory MoreViewCountResponse({
    required int storeCnt,
    required int reviewCnt,
  }) = _MoreViewCountResponse;

  factory MoreViewCountResponse.fromJson(Map<String, dynamic> json) =>
      _$MoreViewCountResponseFromJson(json);
}
