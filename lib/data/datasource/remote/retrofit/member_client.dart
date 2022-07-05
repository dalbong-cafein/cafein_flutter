import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/member/member.dart';
import 'package:cafein_flutter/data/model/member/phone_number_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'member_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class MemberClient {
  factory MemberClient(
    Dio dio, {
    String? baseUrl,
  }) = _MemberClient;

  @PATCH('/members/{memberId}/phone')
  Future<BaseResponse<dynamic>> updatePhoneNumber(
    @Path() int memberId,
    @Body() PhoneNumberRequest phoneNumberRequest,
  );

  @GET('/members/info')
  Future<BaseResponse<Member>> getMember();
}
