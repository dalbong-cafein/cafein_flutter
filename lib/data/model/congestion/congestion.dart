import 'package:freezed_annotation/freezed_annotation.dart';

part 'congestion.g.dart';
part 'congestion.freezed.dart';

@freezed
class Congestion with _$Congestion {
  factory Congestion({
    required int writerId,
    required String nicknameOfWriter,
    required int congestionScore,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Congestion;

  factory Congestion.fromJson(Map<String, dynamic> json) => _$CongestionFromJson(json);
}
