part of 'phone_certification_bloc.dart';

abstract class PhoneCertificationState extends Equatable {
  const PhoneCertificationState();
}

class PhoneCertificationInitial extends PhoneCertificationState {
  const PhoneCertificationInitial();

  @override
  List<Object> get props => [];
}

class PhoneCertificationPhoneNumberValidationChecked extends PhoneCertificationState {
  const PhoneCertificationPhoneNumberValidationChecked({
    required this.isValid,
  });

  final bool isValid;

  @override
  List<Object?> get props => [isValid];
}

class PhoneCertificationCodeValidationChecked extends PhoneCertificationState {
  const PhoneCertificationCodeValidationChecked({
    required this.isVaild,
  });

  final bool isVaild;

  @override
  List<Object?> get props => [isVaild];
}

class PhoneCertificationLoading extends PhoneCertificationState {
  const PhoneCertificationLoading();

  @override
  List<Object?> get props => [];
}

class PhoneCertificationLoaded extends PhoneCertificationState {
  const PhoneCertificationLoaded();

  @override
  List<Object?> get props => [];
}

class PhoneCertificationTimeOuted extends PhoneCertificationState {
  const PhoneCertificationTimeOuted();

  @override
  List<Object?> get props => [];
}

class PhoneCertificationSucceed extends PhoneCertificationState {
  const PhoneCertificationSucceed();

  @override
  List<Object?> get props => [];
}

class PhoneCertificationError extends PhoneCertificationState {
  const PhoneCertificationError();

  @override
  List<Object?> get props => [];
}
