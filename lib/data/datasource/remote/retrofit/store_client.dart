import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/store/auto_completed_store.dart';
import 'package:cafein_flutter/data/model/store/recommended_store.dart';
import 'package:cafein_flutter/data/model/store/registered_store.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/model/store/store_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'store_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class StoreClient {
  factory StoreClient(
    Dio dio, {
    String? baseUrl,
  }) = _StoreClient;

  @GET('/stores')
  Future<BaseResponse<List<Store>>> getStores(
    @Query('keyword') String? keyword,
    @Query('rect') String? rect,
    @Query('centerCoordinates') String? ceterCoordinates,
    @Query('userCoordinates') String? userCoordinates,
  );

  @GET('/stores/recommend-search')
  Future<BaseResponse<List<RecommendedStore>>> getRecommendedStores(
    @Query('keyword') String keyword,
  );

  @GET('/stores/{storeId}')
  Future<BaseResponse<StoreDetail>> getStoreDetail(
    @Path() int storeId,
  );

  @GET('/stores/my-registered')
  Future<BaseResponse<StoreResponse<List<RegisteredStore>>>>
      getMyRegisteredStores();

  @GET('/stores/{storeId}/near-stores')
  Future<BaseResponse<List<Store>>> getNearStoreList(
    @Path() int storeId,
  );

  @GET('/stores/autocomplete-search?keyword={keyword}')
  Future<BaseResponse<List<AutoCompletedStore>>> getAutoCompletedStoreList(
      @Path() String keyword,
      );
}
