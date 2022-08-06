import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_store.g.dart';
part 'member_store.freezed.dart';

@freezed
class MemberStore with _$MemberStore {
  factory MemberStore({
    required int storeId,
    required String storeName,
    required double lngX,
    required double latY,
    required bool isOpen,
    double? congestionScoreAvg,
    @JsonKey(name: 'storeImageDto') required ImageIdPair imageIdPair,
  }) = _MemberStore;

  factory MemberStore.fromJson(Map<String, dynamic> json) => _$MemberStoreFromJson(json);
}
