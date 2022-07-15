import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
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

    if (event.oAuthProvider == 'KAKAO') {
      OAuthToken? oAuthToken;

      try {
        final check = await isKakaoTalkInstalled();
        oAuthToken = check
            ? await UserApi.instance.loginWithKakaoTalk()
            : await UserApi.instance.loginWithKakaoAccount();
        oAuthAccessToken = oAuthToken.accessToken;
      } catch (e) {
        emit(
          LoginError(
            event: () => add(event),
          ),
        );
        return;
      }
    } else if (event.oAuthProvider == 'APPLE') {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.fullName],
        );
        oAuthAccessToken = credential.identityToken;
      } catch (e) {
        emit(
          LoginError(
            event: () => add(event),
          ),
        );
        return;
      }
    }

    emit(
      LoginSocialTokenConfirmed(
        oAuthAccessToken: oAuthAccessToken ?? 'noToken',
        oAuthProvider: event.oAuthProvider,
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
        authProvider: event.oAuthProvider,
        oAuthAccessToken: event.oAuthAccessToken,
      );
      userRepository.setMemberData = response.data;
      emit(
        LoginSucceed(
          isCertifiedPhone: response.data.phoneNumber != null,
          isRegisteredNickname: response.data.nickName != null,
        ),
      );
    } catch (e) {
      if (e is! DioError) {
        emit(
          LoginError(
            event: () => add(event),
          ),
        );
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
