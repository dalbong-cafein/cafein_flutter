import 'dart:async';

import 'package:cafein_flutter/data/model/member/phone_number_request.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'certify_code_event.dart';
part 'certify_code_state.dart';

class CertifyCodeBloc extends Bloc<CertifyCodeEvent, CertifyCodeState> {
  CertifyCodeBloc({
    required this.authRepository,
    required this.userRepository,
    required this.phoneNumber,
  }) : super(const CertifyCodeInitial()) {
    on<CertifyCodeSubmitted>(_onCertifyCodeSubmitted);
    on<CertifyCodeRequested>(_onCertifyCodeRequested);
    on<CertifyCodeTimeOvered>(_onCertifyCodeTimeOvered);
    on<CertifyCodeChanged>(_onCertifyCodeChanged);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;
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

  FutureOr<void> _onCertifyCodeSubmitted(
    CertifyCodeSubmitted event,
    Emitter<CertifyCodeState> emit,
  ) async {
    if (accessCode != event.code) {
      emit(const CertifyCodeFailed());

      return;
    }

    emit(const CertifyCodeLoading());

    try {
      final response = await userRepository.updatePhoneNumber(
        memberId: userRepository.getMemberData?.memberId ?? -1,
        phoneNumberRequest: PhoneNumberRequest(
          phoneNumber: phoneNumber,
        ),
      );

      if (response.code == -1) {
        emit(CertifyCodeError(
          error: Error(),
          event: () => add(event),
        ));

        return;
      }

      userRepository.setMemberData = userRepository.getMemberData!.copyWith(
        phoneNumber: phoneNumber,
      );

      emit(const CertifyCodeSucceed());
    } catch (e) {
      emit(CertifyCodeError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onCertifyCodeRequested(
    CertifyCodeRequested event,
    Emitter<CertifyCodeState> emit,
  ) async {
    emit(const CertifyCodeLoading());
    try {
      final response = await authRepository.getSmsNumber(phoneNumber);
      if (response.code == -1) {
        emit(CertifyCodeError(
          error: Error(),
          event: () => add(event),
        ));

        return;
      }

      accessCode = response.data;
      emit(const CertifyCodeLoaded());
    } catch (e) {
      emit(CertifyCodeError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onCertifyCodeTimeOvered(
    CertifyCodeTimeOvered event,
    Emitter<CertifyCodeState> emit,
  ) {
    emit(const CertifyCodeTimeOuted());
  }
}
