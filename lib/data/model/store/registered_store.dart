import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/store/store_image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registered_store.g.dart';
part 'registered_store.freezed.dart';

@JsonSerializable()
class RegisteredStoreResponse {
  final int storeCnt;
  @JsonKey(name: 'resDtoList')
  final List<RegisteredCafe> storeList;

  RegisteredStoreResponse({
    required this.storeCnt,
    required this.storeList,
  });

  factory RegisteredStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisteredStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredStoreResponseToJson(this);
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
