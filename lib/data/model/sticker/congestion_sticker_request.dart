import 'package:freezed_annotation/freezed_annotation.dart';

part 'congestion_sticker_request.g.dart';
part 'congestion_sticker_request.freezed.dart';

@freezed
class CongestionStickerRequest with _$CongestionStickerRequest {
  factory CongestionStickerRequest({
    required int congestionId,
  }) = _CongestionStickerRequest;

  factory CongestionStickerRequest.fromJson(Map<String, dynamic> json) =>
      _$CongestionStickerRequestFromJson(json);
}
