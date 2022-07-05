import 'package:cafein_flutter/data/model/store/address_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommended_cafe.g.dart';
part 'recommended_cafe.freezed.dart';

@freezed
class RecommendedCafe with _$RecommendedCafe {
  factory RecommendedCafe({
    required int storeId,
    required String storeName,
    @JsonKey(name: 'address') required AddressInfo addressInfo,
  }) = _RecommendedCafe;

  factory RecommendedCafe.fromJson(Map<String, dynamic> json) => _$RecommendedCafeFromJson(json);
}
