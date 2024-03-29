import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.g.dart';
part 'member.freezed.dart';

@freezed
class Member with _$Member {
  factory Member({
    required int memberId,
    String? nickname,
    @JsonKey(name: 'imageDto') ImageIdPair? imageIdPair,
    @JsonKey(name: 'phone') String? phoneNumber,
    required String email,
    @JsonKey(name: 'birth') String? birthDay,
    required String joinDateTime,
    bool? isAgreeLocation,
    bool? isAgreeMarketingPush,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
