import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/sticker_client.dart';
import 'package:cafein_flutter/data/model/sticker/congestion_sticker_request.dart';
import 'package:cafein_flutter/data/model/sticker/review_sticker_request.dart';
import 'package:cafein_flutter/data/model/sticker/sticker.dart';
import 'package:cafein_flutter/data/model/sticker/store_sticker_request.dart';

abstract class StickerRepository {
  Future<BaseResponse<dynamic>> createStoreSticker(
    StoreStickerRequest stickerRequest,
  );

  Future<BaseResponse<dynamic>> createReviewSticker(
    ReviewStickerRequest stickerRequest,
  );

  Future<BaseResponse<dynamic>> createCongestionSticker(
    CongestionStickerRequest stickerRequest,
  );

  Future<BaseResponse<int>> getStickerCount();

  Future<BaseResponse<List<Sticker>>> getStickers();

  Future<BaseResponse<bool>> isPossibleSticker(int storeId);
}

class StickerRepositoryImpl implements StickerRepository {
  final StickerClient stickerClient;

  const StickerRepositoryImpl({
    required this.stickerClient,
  });

  @override
  Future<BaseResponse> createCongestionSticker(
    CongestionStickerRequest stickerRequest,
  ) =>
      stickerClient.createCongestionSticker(stickerRequest);

  @override
  Future<BaseResponse> createReviewSticker(
    ReviewStickerRequest stickerRequest,
  ) =>
      stickerClient.createReviewSticker(stickerRequest);

  @override
  Future<BaseResponse> createStoreSticker(
    StoreStickerRequest stickerRequest,
  ) =>
      stickerClient.createStoreSticker(stickerRequest);

  @override
  Future<BaseResponse<int>> getStickerCount() =>
      stickerClient.getStickerCount();

  @override
  Future<BaseResponse<List<Sticker>>> getStickers() =>
      stickerClient.getStickers();

  @override
  Future<BaseResponse<bool>> isPossibleSticker(int storeId) =>
      stickerClient.isPossibleSticker(storeId);
}
