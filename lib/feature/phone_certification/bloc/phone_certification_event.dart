part of 'phone_certification_bloc.dart';

abstract class PhoneCertificationEvent extends Equatable {
  const PhoneCertificationEvent();
}

class PhoneCertificationPhoneNumberChanged extends PhoneCertificationEvent {
  const PhoneCertificationPhoneNumberChanged({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class PhoneCertificationCodeChanged extends PhoneCertificationEvent {
  const PhoneCertificationCodeChanged({
    required this.code,
  });

  final String code;

  @override
  List<Object?> get props => [code];
}

class PhoneCertificationCodeRequested extends PhoneCertificationEvent {
  const PhoneCertificationCodeRequested({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneCertificationTimeOvered extends PhoneCertificationEvent {
  const PhoneCertificationTimeOvered();

  @override
  List<Object?> get props => [];
}

class PhoneCertificationSubmitted extends PhoneCertificationEvent {
  const PhoneCertificationSubmitted({
    required this.code,
  });

  final String code;

  @override
  List<Object?> get props => [code];
}
