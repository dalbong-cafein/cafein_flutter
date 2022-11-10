import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/sticker/congestion_sticker_request.dart';
import 'package:cafein_flutter/data/model/sticker/review_sticker_request.dart';
import 'package:cafein_flutter/data/model/sticker/sticker.dart';
import 'package:cafein_flutter/data/model/sticker/sticker_possible.dart';
import 'package:cafein_flutter/data/model/sticker/store_sticker_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sticker_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class StickerClient {
  factory StickerClient(
    Dio dio, {
    String? baseUrl,
  }) = _StickerClient;

  @POST('/stickers/storeType')
  Future<BaseResponse<dynamic>> createStoreSticker(
    @Body() StoreStickerRequest stickerRequest,
  );

  @POST('/stickers/reviewType')
  Future<BaseResponse<dynamic>> createReviewSticker(
    @Body() ReviewStickerRequest stickerRequest,
  );

  @POST('/stickers/congestionType')
  Future<BaseResponse<dynamic>> createCongestionSticker(
    @Body() CongestionStickerRequest stickerRequest,
  );

  @GET('/stickers/count-member')
  Future<BaseResponse<int>> getStickerCount();

  @GET('/members/stickers')
  Future<BaseResponse<List<Sticker>>> getStickers();

  @GET('/stickers/check-possible-issue')
  Future<BaseResponse<StickerPossible>> isPossibleSticker();
}
