import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_business_info.g.dart';
part 'total_business_info.freezed.dart';

@freezed
class TotalBusinessInfo with _$TotalBusinessInfo {
  factory TotalBusinessInfo({
    @JsonKey(name: 'onMon') BusinessInfo? onMonday,
    @JsonKey(name: 'onTue') BusinessInfo? onTuesday,
    @JsonKey(name: 'onWed') BusinessInfo? onWednesday,
    @JsonKey(name: 'onThe') BusinessInfo? onThursday,
    @JsonKey(name: 'onFri') BusinessInfo? onFriday,
    @JsonKey(name: 'onSat') BusinessInfo? onSaturday,
    @JsonKey(name: 'onSun') BusinessInfo? onSunday,
    required String etcTime,
  }) = _TotalBusinessInfo;

  factory TotalBusinessInfo.fromJson(Map<String, dynamic> json) =>
      _$TotalBusinessInfoFromJson(json);
}
