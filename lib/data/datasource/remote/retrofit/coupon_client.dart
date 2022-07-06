import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_request.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';
import 'package:cafein_flutter/data/model/coupon/coupon.dart';
import 'package:cafein_flutter/data/model/coupon/coupon_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'coupon_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class CouponClient {
  factory CouponClient(
    Dio dio, {
    String? baseUrl,
  }) = _CouponClient;

  @POST('/coupons')
  Future<BaseResponse<dynamic>> createCoupon(
    @Body() CouponRequest couponRequest,
  );

  @GET('/coupons')
  Future<BaseResponse<List<Coupon>>> getCoupons();
}
