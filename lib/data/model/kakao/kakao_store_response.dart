import 'package:freezed_annotation/freezed_annotation.dart';

part 'kakao_store_response.g.dart';
part 'kakao_store_response.freezed.dart';

@freezed
class KakaoStoreResponse with _$KakaoStoreResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory KakaoStoreResponse({
    required String placeName,
    required String roadAddressName,
  }) = _KakaoStoreResponse;

  factory KakaoStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$KakaoStoreResponseFromJson(json);
}
