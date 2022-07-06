import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.g.dart';
part 'store.freezed.dart';

@freezed
class Store with _$Store {
  factory Store({
    required int storeId,
    required String storeName,
    required int recommendPercent,
    required double lngX,
    required double latY,
    required int heartCnt,
    double? congestionScoreAvg,
    @JsonKey(name: 'storeImageDto') required ImageIdPair imageIdPair,
    @JsonKey(name: 'businessHoursInfoDto') required BusinessInfo businessInfo,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
