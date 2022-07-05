import 'package:cafein_flutter/data/model/store/address_info.dart';
import 'package:cafein_flutter/data/model/store/total_business_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registered_cafe_request.freezed.dart';

@freezed
class RegisteredCafeRequest with _$RegisteredCafeRequest {
  factory RegisteredCafeRequest({
    required String storeName,
    required AddressInfo addressInfo,
    required String phoneNumber,
    required String wifiPassword,
    required String webSite,
    required double lngX,
    required double latY,
    required List<String>? imageFiles,
    required TotalBusinessInfo totalBusinessInfo,
    required String recommendation,
    required String socket,
    required String wifi,
    required String restroom,
    required String tableSize,
  }) = _RegisteredCafeRequest;

  factory RegisteredCafeRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisteredCafeRequestFromJson(json);
}
