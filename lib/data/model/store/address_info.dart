import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_info.g.dart';
part 'address_info.freezed.dart';

@freezed
class AddressInfo with _$AddressInfo {
  factory AddressInfo({
    @JsonKey(name: 'siNm') required String cityName,
    @JsonKey(name: 'sggNm') required String districtName,
    required String detail,
    required String fullAddress,
    @JsonKey(name: 'rnum') required String roadNumber,
    @JsonKey(name: 'rnm') required String roadName,
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) => _$AddressInfoFromJson(json);
}
