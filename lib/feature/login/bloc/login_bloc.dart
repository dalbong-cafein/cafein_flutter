import 'dart:async';

import 'package:cafein_flutter/data/model/auth/social_login_request.dart';
import 'package:cafein_flutter/data/model/enum/auth_provider.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const LoginInitial()) {
    on<LoginSocialTokenRequested>(_onLoginSocialTokenRequested);
    on<LoginRequested>(_onLoginRequested);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;

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
      } catch (e) {
        emit(LoginError(event: () => add(event)));

        return;
      }
    } else {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: AppleIDAuthorizationScopes.values,
        );
        oAuthAccessToken = credential.identityToken;
        username = '${credential.familyName}${credential.givenName}';
      } catch (e) {
        emit(LoginError(event: () => add(event)));

        return;
      }
    }

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
      emit(
        LoginSucceed(
          isCertifiedPhone: response.data.phoneNumber != null,
          isRegisteredNickname: response.data.nickname != null,
        ),
      );
    } catch (e) {
      debugPrint('$e');
      if (e is! DioError) {
        emit(LoginError(event: () => add(event)));

        return;
      }

      bool isNetworkError = false;

      if (e.type == DioErrorType.other) {
        isNetworkError = true;
      }

      emit(
        LoginError(
          isNetworkError: isNetworkError,
          event: () => add(event),
        ),
      );
    }
  }
}
