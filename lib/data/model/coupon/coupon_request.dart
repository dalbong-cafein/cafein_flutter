import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_request.g.dart';
part 'coupon_request.freezed.dart';

@freezed
class CouponRequest with _$CouponRequest {
  factory CouponRequest({
    required String brandName,
    required String itemName,
  }) = _CouponRequest;

  factory CouponRequest.fromJson(Map<String, dynamic> json) => _$CouponRequestFromJson(json);
}
