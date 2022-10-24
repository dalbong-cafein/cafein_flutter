import 'dart:async';

import 'package:cafein_flutter/data/repository/app_repository.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.authRepository,
    required this.userRepository,
    required this.appRepository,
  }) : super(const SplashInitial()) {
    on<SplashLoginRequested>(_onSplashLoginRequested);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;
  final AppRepository appRepository;

  FutureOr<void> _onSplashLoginRequested(
    SplashLoginRequested event,
    Emitter<SplashState> emit,
  ) async {
    final tokenData = authRepository.getTokenData();

    if (tokenData == null) {
      emit(const SplashLoginChecked());

      return;
    }

    try {
      final response = await userRepository.getMember();

      final userData = response.data;
      userRepository.setMemberData = response.data;

      if (userData.isAgreeLocation == null) {
        emit(const SplashTermsChecked());

        return;
      }

      if (userData.phoneNumber == null) {
        emit(const SplashPhoneChecked());

        return;
      }

      if (userData.nickname == null) {
        emit(const SplashProfileChecked());

        return;
      }

      if (!appRepository.isOnboardSkip()) {
        emit(const SplashOnboardChecked());

        return;
      }
      emit(const SplashMainChecked());
    } catch (e) {
      emit(const SplashError());
    }
  }
}
