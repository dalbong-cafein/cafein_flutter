import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_info.g.dart';
part 'business_info.freezed.dart';

@freezed
class BusinessInfo with _$BusinessInfo {
  factory BusinessInfo({
    @Default(false) bool isOpen,
    String? closed,
    String? open,
    @Default('10:00') String nextOpen,
    String? holidayType
  }) = _BusinessInfo;

  factory BusinessInfo.fromJson(Map<String, dynamic> json) =>
      _$BusinessInfoFromJson(json);
}
