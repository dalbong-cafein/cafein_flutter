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
    double? recommendPercent,
    required double lngX,
    required double latY,
    required int heartCnt,
    required bool isHeart,
    double? congestionScoreAvg,
    double? distance,
    @JsonKey(name: 'storeImageDtoList') List<ImageIdPair>? imageIdPair,
    @JsonKey(name: 'businessHoursInfoDto') BusinessInfo? businessInfo,
    required ImageIdPair? representImage
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
