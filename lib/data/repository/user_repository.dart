import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/member_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/member_client.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/member/member.dart';
import 'package:cafein_flutter/data/model/member/phone_number_request.dart';
import 'package:cafein_flutter/data/model/member/update_member_request.dart';

abstract class UserRepository {
  Member? _member;

  set setMemberData(Member member);
  Member? get getMemberData => _member;

  Future<BaseResponse<dynamic>> updatePhoneNumber({
    required int memberId,
    required PhoneNumberRequest phoneNumberRequest,
  });

  Future<BaseResponse<Member>> getMember();

  Future<BaseResponse<ImageIdPair>> updateMember(
    UpdateMemberRequest updateMemberRequest,
  );
}

class UserRepositoryImpl extends UserRepository {
  final MemberClient memberClient;
  final MemberFormDataClient memberFormDataClient;

  UserRepositoryImpl({
    required this.memberClient,
    required this.memberFormDataClient,
  });

  @override
  Future<BaseResponse<Member>> getMember() => memberClient.getMember();

  @override
  Future<BaseResponse<ImageIdPair>> updateMember(
    UpdateMemberRequest updateMemberRequest,
  ) =>
      memberFormDataClient.updateMember(updateMemberRequest);

  @override
  Future<BaseResponse> updatePhoneNumber({
    required int memberId,
    required PhoneNumberRequest phoneNumberRequest,
  }) =>
      memberClient.updatePhoneNumber(
        memberId,
        phoneNumberRequest,
      );

  @override
  set setMemberData(Member member) => _member = member;
}
