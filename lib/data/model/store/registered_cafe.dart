import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/store/store_image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registered_cafe.g.dart';
part 'registered_cafe.freezed.dart';

@JsonSerializable()
class RegisteredCafeResponse {
  final int storeCnt;
  @JsonKey(name: 'resDtoList')
  final List<RegisteredCafe> storeList;

  RegisteredCafeResponse({
    required this.storeCnt,
    required this.storeList,
  });

  factory RegisteredCafeResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisteredCafeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredCafeResponseToJson(this);
}

@freezed
class RegisteredCafe with _$RegisteredCafe {
  factory RegisteredCafe({
    required int storeId,
    required String storeName,
    @JsonKey(name: 'businessHoursInfoDto') required BusinessInfo businessInfo,
    double? congestionScoreAvg,
    @JsonKey(name: 'storeImageDto') required StoreImageIdPair storeImageIdPair,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _RegisteredCafe;

  factory RegisteredCafe.fromJson(Map<String, dynamic> json) => _$RegisteredCafeFromJson(json);
}
