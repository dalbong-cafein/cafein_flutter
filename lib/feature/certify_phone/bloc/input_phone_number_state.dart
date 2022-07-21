part of 'input_phone_number_bloc.dart';

abstract class InputPhoneNumberState extends Equatable {
  const InputPhoneNumberState();
}

class PhoneCertificationInitial extends InputPhoneNumberState {
  const PhoneCertificationInitial();

  @override
  List<Object> get props => [];
}

class PhoneCertificationPhoneNumberValidationChecked extends InputPhoneNumberState {
  const PhoneCertificationPhoneNumberValidationChecked({
    required this.isValid,
  });

  final bool isValid;

  @override
  List<Object?> get props => [isValid];
}
