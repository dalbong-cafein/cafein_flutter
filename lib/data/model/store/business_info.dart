import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_info.g.dart';
part 'business_info.freezed.dart';

@freezed
class BusinessInfo with _$BusinessInfo {
  factory BusinessInfo({
    required bool isOpen,
    required String closed,
    @Default('10:00') String tmrOpen,
  }) = _BusinessInfo;

  factory BusinessInfo.fromJson(Map<String, dynamic> json) => _$BusinessInfoFromJson(json);
}
