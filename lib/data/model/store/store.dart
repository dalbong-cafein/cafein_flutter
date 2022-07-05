import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/store/store_image_id_pair.dart';
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
    @JsonKey(name: 'storeImageDto') required StoreImageIdPair storeImageIdPair,
    @JsonKey(name: 'businessHoursInfoDto') required BusinessInfo businessInfo,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
