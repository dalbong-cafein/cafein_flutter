import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'input_phone_number_event.dart';
part 'input_phone_number_state.dart';

class InputPhoneNumberBloc extends Bloc<InputPhoneNumberEvent, InputPhoneNumberState> {
  InputPhoneNumberBloc({
    required this.authRepository,
  }) : super(const PhoneCertificationInitial()) {
    on<PhoneCertificationPhoneNumberChanged>(_onPhoneCertificationPhoneNumberChanged);
  }

  final AuthRepository authRepository;

  FutureOr<void> _onPhoneCertificationPhoneNumberChanged(
    PhoneCertificationPhoneNumberChanged event,
    Emitter<InputPhoneNumberState> emit,
  ) {
    emit(
      PhoneCertificationPhoneNumberValidationChecked(
        isValid: event.phoneNumber.length == 11,
      ),
    );
  }
}
