import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_request.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'congestion_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class CongestionClient {
  factory CongestionClient(
    Dio dio, {
    String? baseUrl,
  }) = _CongestionClient;

  @POST('/congestion')
  Future<BaseResponse<int>> createCongestion(
    @Body() CongestionRequest congestionRequest,
  );

  @DELETE('/stores/{storeId}/congestion')
  Future<BaseResponse<CongestionResponse>> getCongestions(
    @Path() int storeId,
    @Query('minusDays') int minusDays,
  );
}
