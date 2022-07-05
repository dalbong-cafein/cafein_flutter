import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'store_client.g.dart';

@RestApi(baseUrl: '${CafeinConfig.baseUrl}/stores')
abstract class StoreClient {
  factory StoreClient(
    Dio dio, {
    String? baseUrl,
  }) = _StoreClient;

  @GET('/test')
  Future<BaseResponse<List<Store>>> getCafes();
}
