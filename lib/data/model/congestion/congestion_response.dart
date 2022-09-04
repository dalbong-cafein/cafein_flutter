import 'package:cafein_flutter/data/model/congestion/congestion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'congestion_response.g.dart';
part 'congestion_response.freezed.dart';

@freezed
class CongestionResponse with _$CongestionResponse {
  factory CongestionResponse({
    required int congestionCnt,
    @JsonKey(name: 'resDtoList') required List<Congestion> congestionList,
  }) = _CongestionResponse;

  factory CongestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CongestionResponseFromJson(json);
}
