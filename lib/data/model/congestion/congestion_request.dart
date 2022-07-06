import 'package:freezed_annotation/freezed_annotation.dart';

part 'congestion_request.g.dart';
part 'congestion_request.freezed.dart';

@freezed
class CongestionRequest with _$CongestionRequest {
  factory CongestionRequest({
    required int storeId,
    required int congestionScore,
  }) = _CongestionRequest;

  factory CongestionRequest.fromJson(Map<String, dynamic> json) =>
      _$CongestionRequestFromJson(json);
}
