import 'dart:async';

import 'package:cafein_flutter/data/model/auth/social_login_request.dart';
import 'package:cafein_flutter/data/model/enum/auth_provider.dart';
import 'package:cafein_flutter/data/repository/app_repository.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.authRepository,
    required this.userRepository,
    required this.appRepository,
  }) : super(const LoginInitial()) {
    on<LoginSocialTokenRequested>(_onLoginSocialTokenRequested);
    on<LoginRequested>(_onLoginRequested);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;
  final AppRepository appRepository;

  FutureOr<void> _onLoginSocialTokenRequested(
    LoginSocialTokenRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    String? oAuthAccessToken;
    String? username;

    if (event.authProvider == AuthProvider.kakao) {
      OAuthToken? oAuthToken;
      try {
        final check = await isKakaoTalkInstalled();
        oAuthToken = check
            ? await UserApi.instance.loginWithKakaoTalk()
            : await UserApi.instance.loginWithKakaoAccount();
        oAuthAccessToken = oAuthToken.accessToken;
        // print("AcccessToken : "+ oAuthAccessToken);
        // print("RefreshToken : " + oAuthToken.refreshToken.toString());
        // print("AccessToken Expire : " + oAuthToken.expiresAt.toString());
        // print("RefreshToken Expire : " + oAuthToken.refreshTokenExpiresAt.toString());
        appRepository.setAuthProvider(AuthProvider.kakao.name);
      } catch (e) {
        emit(LoginError(
          error: e,
          event: () => add(event),
        ));

        return;
      }
    } else {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: AppleIDAuthorizationScopes.values,
        );
        oAuthAccessToken = credential.identityToken;
        username = '${credential.familyName}${credential.givenName}';
        appRepository.setAuthProvider(AuthProvider.apple.name);
      } catch (e) {
        emit(LoginError(
          error: e,
          event: () => add(event),
        ));

        return;
      }
    }

    userRepository.setAuthProvider = event.authProvider.name;

    emit(
      LoginSocialTokenConfirmed(
        socialLoginRequest: SocialLoginRequest(
          authProvider: event.authProvider,
          authToken: oAuthAccessToken ?? 'noToken',
          username: username,
        ),
      ),
    );
  }

  FutureOr<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    try {
      final response = await authRepository.login(
        socialLoginRequest: event.socialLoginRequest,
      );
      userRepository.setMemberData = response.data;
      final isOnboardSkip = appRepository.isOnboardSkip();

      if (!isOnboardSkip) {
        await appRepository.setOnboardSkip();
      }

      emit(
        LoginSucceed(
          isCertifiedPhone: response.data.phoneNumber != null,
          isRegisteredNickname: response.data.nickname != null,
          isOnboardSkip: isOnboardSkip,
          isTermsChecked: response.data.isAgreeLocation != null,
        ),
      );
    } catch (e) {
      emit(LoginError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
