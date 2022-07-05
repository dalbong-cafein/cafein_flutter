import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_member_request.freezed.dart';

@freezed
class UpdateMemberRequest with _$UpdateMemberRequest {
  factory UpdateMemberRequest({
    required int memberId,
    required String nickName,
    String? imageFile,
    int? deleteImageId,
  }) = _UpdateMemberRequest;
}
