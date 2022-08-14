import 'package:cafein_flutter/data/datasource/local/preference/auth_preference.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/auth_client.dart';
import 'package:cafein_flutter/data/model/auth/account_unite_request.dart';
import 'package:cafein_flutter/data/model/auth/social_login_request.dart';
import 'package:cafein_flutter/data/model/auth/token_data.dart';
import 'package:cafein_flutter/data/model/member/member.dart';

abstract class AuthRepository {
  Future<BaseResponse<dynamic>> refreshAccessToken();

  Future<BaseResponse<String>> getSmsNumber(
    String phoneNumber,
  );

  Future<BaseResponse<Member>> accountUnite(
    AccountUniteRequest accountUniteRequest,
  );

  Future<BaseResponse<Member>> login({
    required SocialLoginRequest socialLoginRequest,
  });

  Future<BaseResponse<bool>> duplicateNickname(String nickname);

  Future<dynamic> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthClient authClient;
  final AuthPreference authPreference;

  AuthRepositoryImpl({
    required this.authClient,
    required this.authPreference,
  });

  @override
  Future<BaseResponse<Member>> accountUnite(
    AccountUniteRequest accountUniteRequest,
  ) =>
      authClient.accountUnite(accountUniteRequest).then(
        (value) {
          return value.data;
        },
      );

  @override
  Future<BaseResponse<String>> getSmsNumber(String phoneNumber) =>
      authClient.getSmsNumber(phoneNumber);

  @override
  Future<BaseResponse<Member>> login({
    required SocialLoginRequest socialLoginRequest,
  }) =>
      authClient.login(socialLoginRequest).then(
        (value) {
          final List<String> tokenDatas = value.response.headers['set-cookie'] ?? [];
          if (tokenDatas.isNotEmpty) {
            final accessToken = tokenDatas.first.substring(12).split(';').first;
            final refreshToken = tokenDatas.last.substring(13).split(';').first;
            authPreference.setTokenData(
              TokenData(
                accessToken: accessToken,
                refreshToken: refreshToken,
              ),
            );
          }
          return value.data;
        },
      );

  @override
  Future<BaseResponse> refreshAccessToken() => authClient.refreshAccessToken().then(
        (value) {
          return value.data;
        },
      );

  @override
  Future<BaseResponse<bool>> duplicateNickname(String nickname) =>
      authClient.duplicateNickname(nickname);

  @override
  Future<dynamic> signOut() => authPreference.box.clear();
}
