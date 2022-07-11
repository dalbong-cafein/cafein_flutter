import 'package:cafein_flutter/data/model/store/total_business_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_store_request.freezed.dart';
part 'update_store_request.g.dart';

@freezed
class UpdateStoreRequest with _$UpdateStoreRequest {
  factory UpdateStoreRequest({
    required int storeId,
    required String phoneNumber,
    required String wifiPassword,
    required String webSite,
    required List<String>? updateImageFiles,
    required List<int>? deleteImageIds,
    required TotalBusinessInfo totalBusinessInfo,
  }) = _UpdateStoreRequest;

  factory UpdateStoreRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateStoreRequestFromJson(json);
}
