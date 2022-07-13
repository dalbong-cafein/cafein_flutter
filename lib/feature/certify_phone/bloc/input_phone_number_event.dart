part of 'input_phone_number_bloc.dart';

abstract class InputPhoneNumberEvent extends Equatable {
  const InputPhoneNumberEvent();
}

class PhoneCertificationPhoneNumberChanged extends InputPhoneNumberEvent {
  const PhoneCertificationPhoneNumberChanged({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}
