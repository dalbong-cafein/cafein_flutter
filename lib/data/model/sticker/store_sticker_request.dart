import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_sticker_request.g.dart';
part 'store_sticker_request.freezed.dart';

@freezed
class StoreStickerRequest with _$StoreStickerRequest {
  factory StoreStickerRequest({
    required int storeId,
  }) = _StoreStickerRequest;

  factory StoreStickerRequest.fromJson(Map<String, dynamic> json) =>
      _$StoreStickerRequestFromJson(json);
}
