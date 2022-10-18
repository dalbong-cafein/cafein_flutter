import 'dart:async';

import 'package:cafein_flutter/data/model/enum/auth_provider.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'sign_off_event.dart';
part 'sign_off_state.dart';

class SignOffBloc extends Bloc<SignOffEvent, SignOffState> {
  SignOffBloc({
    required this.userRepository,
  }) : super(const SignOffInitial()) {
    on<SignOffRequested>(_onSignOffRequested);
  }

  final UserRepository userRepository;

  FutureOr<void> _onSignOffRequested(
    SignOffRequested event,
    Emitter<SignOffState> emit,
  ) async {
    emit(const SignOffLoading());

    try {
      final response = await userRepository.deleteMember();

      if (response.code == -1) {
        emit(
          SignOffError(
            error: Error(),
            event: () => add(
              event,
            ),
          ),
        );

        return;
      }

      if (userRepository.getAuthProvider == AuthProvider.kakao.name) {
        await UserApi.instance.unlink();
      } else if (userRepository.getAuthProvider == AuthProvider.apple.name) {}
      emit(const SignOffSucceed());
    } catch (e) {
      emit(
        SignOffError(
          error: e,
          event: () => add(
            event,
          ),
        ),
      );
    }
  }
}
