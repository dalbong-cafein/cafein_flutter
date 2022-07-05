import 'package:cafein_flutter/data/model/store/address_info.dart';
import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/store/store_image_id_pair.dart';
import 'package:cafein_flutter/data/model/store/total_business_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_detail.g.dart';
part 'cafe_detail.freezed.dart';

@freezed
class CafeDetail with _$CafeDetail {
  factory CafeDetail({
    required int storeId,
    required String storeName,
    required String nicknameOfModMember,
    @JsonKey(name: 'memberImageDto') required StoreImageIdPair storeImageIdPair,
    @JsonKey(name: 'address') required AddressInfo addressInfo,
    required String wifiPassword,
    required int heartCnt,
    required bool isHeart,
    @JsonKey(name: 'businessHoursInfoDto') required BusinessInfo businessInfo,
    required double lngX,
    required double latY,
    required List<StoreImageIdPair> reviewImageList,
    required List<StoreImageIdPair> storeImageList,
    @JsonKey(name: 'totalBusinessHoursResDto') required TotalBusinessInfo totalBusinessInfo,
  }) = _CafeDetail;

  factory CafeDetail.fromJson(Map<String, dynamic> json) => _$CafeDetailFromJson(json);
}
