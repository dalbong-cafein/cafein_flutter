import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_off_event.dart';
part 'sign_off_state.dart';

class SignOffBloc extends Bloc<SignOffEvent, SignOffState> {
  SignOffBloc() : super(const SignOffInitial()) {
    on<SignOffRequested>(_onSignOffRequested);
  }

  FutureOr<void> _onSignOffRequested(
    SignOffRequested event,
    Emitter<SignOffState> emit,
  ) async {
    emit(const SignOffLoading());

    try {
      // TODO: 회원탈퇴 이벤트
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
