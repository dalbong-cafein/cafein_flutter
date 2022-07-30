import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/auth/account_unite_request.dart';
import 'package:cafein_flutter/data/model/auth/social_login_request.dart';
import 'package:cafein_flutter/data/model/member/member.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class AuthClient {
  factory AuthClient(
    Dio dio, {
    String? baseUrl,
  }) = _AuthClient;

  @GET('/auth/refreshToken')
  Future<HttpResponse<BaseResponse<dynamic>>> refreshAccessToken();

  @GET('/auth/send-sms')
  Future<BaseResponse<String>> getSmsNumber(
    @Query('toNumber') String phoneNumber,
  );

  @PATCH('/auth/account-unite')
  Future<HttpResponse<BaseResponse<Member>>> accountUnite(
    @Body() AccountUniteRequest accountUniteRequest,
  );

  @POST('/auth/social-login')
  Future<HttpResponse<BaseResponse<Member>>> login(
    @Body() SocialLoginRequest socialRequest,
  );

  @GET('/auth/duplicate-nickname')
  Future<BaseResponse<bool>> duplicateNickname(
    @Query('nickname') String nickname,
  );
}
