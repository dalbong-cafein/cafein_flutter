import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_completed_store.g.dart';
part 'auto_completed_store.freezed.dart';

@freezed
class AutoCompletedStore with _$AutoCompletedStore {
  factory AutoCompletedStore({
    @JsonKey(name: 'storeId') required int storeId,
    @JsonKey(name: 'storeName') required String storeName,
    @JsonKey(name: 'fullAddress') required String fullAddress,
  }) = _AutoCompletedStore;

  factory AutoCompletedStore.fromJson(Map<String, dynamic> json) =>
      _$AutoCompletedStoreFromJson(json);
}