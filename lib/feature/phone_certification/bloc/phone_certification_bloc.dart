import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_certification_event.dart';
part 'phone_certification_state.dart';

class PhoneCertificationBloc extends Bloc<PhoneCertificationEvent, PhoneCertificationState> {
  PhoneCertificationBloc({
    required this.authRepository,
  }) : super(const PhoneCertificationInitial()) {
    on<PhoneCertificationPhoneNumberChanged>(_onPhoneCertificationPhoneNumberChanged);
    on<PhoneCertificationCodeRequested>(_onPhoneCertificationCodeRequested);
    on<PhoneCertificationCodeChanged>(_onPhoneCertificationCodeChanged);
    on<PhoneCertificationTimeOvered>(_onPhoneCertificationTimeOvered);
    on<PhoneCertificationSubmitted>(_onPhoneCertificationSubmitted);
  }

  final AuthRepository authRepository;
  String accessCode = '';

  FutureOr<void> _onPhoneCertificationPhoneNumberChanged(
    PhoneCertificationPhoneNumberChanged event,
    Emitter<PhoneCertificationState> emit,
  ) {
    emit(
      PhoneCertificationPhoneNumberValidationChecked(
        isValid: event.phoneNumber.length == 11,
      ),
    );
  }

  FutureOr<void> _onPhoneCertificationCodeRequested(
    PhoneCertificationCodeRequested event,
    Emitter<PhoneCertificationState> emit,
  ) async {
    emit(const PhoneCertificationLoading());
    try {
      final response = await authRepository.getSmsNumber(event.phoneNumber);
      if (response.code != -1) {
        accessCode = response.data;
        emit(const PhoneCertificationLoaded());
      }
      emit(const PhoneCertificationError());
    } catch (e) {
      emit(const PhoneCertificationError());
    }
  }

  FutureOr<void> _onPhoneCertificationCodeChanged(
    PhoneCertificationCodeChanged event,
    Emitter<PhoneCertificationState> emit,
  ) {
    emit(
      PhoneCertificationCodeValidationChecked(
        isVaild: event.code.length == 6,
      ),
    );
  }

  FutureOr<void> _onPhoneCertificationTimeOvered(
    PhoneCertificationTimeOvered event,
    Emitter<PhoneCertificationState> emit,
  ) {
    emit(const PhoneCertificationTimeOuted());
  }

  FutureOr<void> _onPhoneCertificationSubmitted(
    PhoneCertificationSubmitted event,
    Emitter<PhoneCertificationState> emit,
  ) {
    if (event.code == accessCode) {
      emit(const PhoneCertificationSucceed());
    } else {
      emit(const PhoneCertificationError());
    }
  }
}
