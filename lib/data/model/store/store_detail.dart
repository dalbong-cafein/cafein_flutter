import 'package:cafein_flutter/data/model/store/address_info.dart';
import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/store/total_business_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_detail.g.dart';
part 'store_detail.freezed.dart';

@freezed
class StoreDetail with _$StoreDetail {
  factory StoreDetail({
    required int storeId,
    required String storeName,
    String? nicknameOfModMember,
    @JsonKey(name: 'memberImageDto') ImageIdPair? imageIdPair,
    @JsonKey(name: 'address') required AddressInfo addressInfo,
    String? wifiPassword,
    required int heartCnt,
    required bool isHeart,
    @JsonKey(name: 'businessHoursInfoDto') required BusinessInfo businessInfo,
    required double lngX,
    required double latY,
    required List<ImageIdPair> reviewImageList,
    required List<ImageIdPair> storeImageList,
    ImageIdPair? representImage,
    double? congestionScoreAvg,
    @JsonKey(name: 'totalBusinessHoursResDto')
        TotalBusinessInfo? totalBusinessInfo,
    required String regDateTime,
    required String modDateTime,
    String? phone,
    String? website,
  }) = _StoreDetail;

  factory StoreDetail.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailFromJson(json);
}
