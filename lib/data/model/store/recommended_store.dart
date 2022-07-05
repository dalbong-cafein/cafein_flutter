import 'package:cafein_flutter/data/model/store/address_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommended_store.g.dart';
part 'recommended_store.freezed.dart';

@freezed
class RecommendedStore with _$RecommendedStore {
  factory RecommendedStore({
    required int storeId,
    required String storeName,
    @JsonKey(name: 'address') required AddressInfo addressInfo,
  }) = _RecommendedStore;

  factory RecommendedStore.fromJson(Map<String, dynamic> json) => _$RecommendedStoreFromJson(json);
}
