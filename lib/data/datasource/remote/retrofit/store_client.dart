import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/store/recommended_store.dart';
import 'package:cafein_flutter/data/model/store/registered_store.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'store_client.g.dart';

@RestApi(baseUrl: '${CafeinConfig.baseUrl}/stores')
abstract class StoreClient {
  factory StoreClient(
    Dio dio, {
    String? baseUrl,
  }) = _StoreClient;

  @GET('')
  Future<BaseResponse<List<Store>>> getStores(
    @Query('keyword') String keyword,
  );

  @GET('/recommend-search')
  Future<BaseResponse<List<RecommendedStore>>> getRecommendedStores(
    @Query('keyword') String keyword,
  );

  @GET('/{storeId}')
  Future<BaseResponse<StoreDetail>> getStoreDetail(
    @Path() int storeId,
  );

  @GET('/my-registered')
  Future<BaseResponse<RegisteredStoreResponse>> getMyRegisteredStores();
}
