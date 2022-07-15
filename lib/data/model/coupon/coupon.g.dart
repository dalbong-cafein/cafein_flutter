// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coupon _$$_CouponFromJson(Map<String, dynamic> json) => _$_Coupon(
      couponId: json['couponId'] as int,
      brandName: json['brandName'] as String,
      itemName: json['itemName'] as String,
      status: json['status'] as bool,
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_CouponToJson(_$_Coupon instance) => <String, dynamic>{
      'couponId': instance.couponId,
      'brandName': instance.brandName,
      'itemName': instance.itemName,
      'status': instance.status,
      'regDateTime': instance.registeredDateTime,
    };
