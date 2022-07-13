import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'certify_code_event.dart';
part 'certify_code_state.dart';

class CertifyCodeBloc extends Bloc<CertifyCodeEvent, CertifyCodeState> {
  CertifyCodeBloc({
    required this.authRepository,
    required this.phoneNumber,
  }) : super(const CertifyCodeInitial()) {
    on<CertifyCodeSubmitted>(_onCerfifyCodeSubmitted);
    on<CertifyCodeRequested>(_onCertifyCodeRequested);
    on<CertifyCodeTimeOvered>(_onCertifyCodeTimeOvered);
    on<CertifyCodeChanged>(_onCertifyCodeChanged);
  }

  final AuthRepository authRepository;
  final String phoneNumber;

  String accessCode = '';

  FutureOr<void> _onCertifyCodeChanged(
    CertifyCodeChanged event,
    Emitter<CertifyCodeState> emit,
  ) {
    emit(
      CertifyCodeValidationChecked(
        isVaild: event.code.length == 6,
      ),
    );
  }

  FutureOr<void> _onCerfifyCodeSubmitted(
    CertifyCodeSubmitted event,
    Emitter<CertifyCodeState> emit,
  ) {
    if (accessCode == event.code) {
      emit(const CertifyCodeSucceed());
    } else {
      emit(const CertifyCodeError());
    }
  }

  FutureOr<void> _onCertifyCodeRequested(
    CertifyCodeRequested event,
    Emitter<CertifyCodeState> emit,
  ) async {
    emit(const CertifyCodeLoading());
    try {
      final response = await authRepository.getSmsNumber(phoneNumber);
      if (response.code != -1) {
        accessCode = response.data;
        emit(const CertifyCodeLoaded());
        return;
      }
      emit(const CertifyCodeError());
    } catch (e) {
      emit(const CertifyCodeError());
    }
  }

  FutureOr<void> _onCertifyCodeTimeOvered(
    CertifyCodeTimeOvered event,
    Emitter<CertifyCodeState> emit,
  ) {
    emit(const CertifyCodeTimeOuted());
  }
}
