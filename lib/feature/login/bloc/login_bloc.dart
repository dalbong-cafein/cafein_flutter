import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.authRepository,
  }) : super(const LoginInitial()) {
    on<LoginSocialTokenRequested>(_onLoginSocialTokenRequested);
    on<LoginRequested>(_onLoginRequested);
  }

  final AuthRepository authRepository;

  FutureOr<void> _onLoginSocialTokenRequested(
    LoginSocialTokenRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    OAuthToken? oAuthToken;
    try {
      final check = await isKakaoTalkInstalled();
      oAuthToken = check
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
    } catch (e) {
      emit(const LoginError());
      return;
    }

    emit(
      LoginSocialTokenConfirmed(
        oAuthAccessToken: oAuthToken.accessToken,
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
      emit(const LoginSucceed());
    } catch (e) {
      emit(const LoginError());
    }
  }
}
