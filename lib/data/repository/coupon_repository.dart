import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/coupon_client.dart';
import 'package:cafein_flutter/data/model/coupon/coupon.dart';
import 'package:cafein_flutter/data/model/coupon/coupon_request.dart';

abstract class CouponRepository {
  Future<BaseResponse<dynamic>> createCoupon(
    CouponRequest couponRequest,
  );

  Future<BaseResponse<List<Coupon>>> getCoupons();
}

class CouponRepositoryImpl implements CouponRepository {
  final CouponClient couponClient;

  CouponRepositoryImpl({
    required this.couponClient,
  });

  @override
  Future<BaseResponse> createCoupon(
    CouponRequest couponRequest,
  ) =>
      couponClient.createCoupon(couponRequest);

  @override
  Future<BaseResponse<List<Coupon>>> getCoupons() => couponClient.getCoupons();
}
