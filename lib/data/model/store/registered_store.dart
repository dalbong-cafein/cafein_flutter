import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registered_store.g.dart';
part 'registered_store.freezed.dart';

@freezed
class RegisteredStore with _$RegisteredStore {
  factory RegisteredStore({
    required int storeId,
    required String storeName,
    @JsonKey(name: 'businessHoursInfoDto') required BusinessInfo businessInfo,
    double? congestionScoreAvg,
    @JsonKey(name: 'storeImageDto') required ImageIdPair imageIdPair,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _RegisteredStore;

  factory RegisteredStore.fromJson(Map<String, dynamic> json) => _$RegisteredStoreFromJson(json);
}
