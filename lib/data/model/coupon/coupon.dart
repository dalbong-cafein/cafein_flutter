import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon.g.dart';
part 'coupon.freezed.dart';

@freezed
class Coupon with _$Coupon {
  factory Coupon({
    required int couponId,
    required String brandName,
    required String itemName,
    required bool status,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
