import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/model/store/store_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'heart_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class HeartClient {
  factory HeartClient(
    Dio dio, {
    String? baseUrl,
  }) = _HeartClient;

  @POST('/stores/{storeId}/hearts')
  Future<BaseResponse<dynamic>> createHeart(
    @Path() int storeId,
  );

  @DELETE('/stores/{storeId}/hearts')
  Future<BaseResponse<dynamic>> deleteHeart(
    @Path() int storeId,
  );

  @GET('/hearts')
  Future<BaseResponse<StoreResponse<MemberStore>>> getMyStores();

  @GET('/hearts/limit')
  Future<BaseResponse<StoreResponse<MemberStore>>> getMyStoresLimit();
}
