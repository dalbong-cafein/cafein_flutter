part of 'certify_code_bloc.dart';

abstract class CertifyCodeState extends Equatable {
  const CertifyCodeState();

  @override
  List<Object?> get props => [];
}

class CertifyCodeInitial extends CertifyCodeState {
  const CertifyCodeInitial();
}

class CertifyCodeValidationChecked extends CertifyCodeState {
  const CertifyCodeValidationChecked({
    required this.isVaild,
  });

  final bool isVaild;

  @override
  List<Object?> get props => [isVaild];
}

class CertifyCodeLoaded extends CertifyCodeState {
  const CertifyCodeLoaded();
}

class CertifyCodeLoading extends CertifyCodeState {
  const CertifyCodeLoading();
}

class CertifyCodeSucceed extends CertifyCodeState {
  const CertifyCodeSucceed();
}

class CertifyCodeFailed extends CertifyCodeState {
  const CertifyCodeFailed();
}

class CertifyCodeError extends CertifyCodeState {
  const CertifyCodeError({
    required this.event,
    this.isNetworkError = false,
  });

  final bool isNetworkError;
  final Function event;

  @override
  List<Object?> get props => [isNetworkError];
}

class CertifyCodeTimeOuted extends CertifyCodeState {
  const CertifyCodeTimeOuted();
}
