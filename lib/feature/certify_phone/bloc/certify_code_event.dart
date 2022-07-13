part of 'certify_code_bloc.dart';

abstract class CertifyCodeEvent extends Equatable {
  const CertifyCodeEvent();

  @override
  List<Object> get props => [];
}

class CertifyCodeRequested extends CertifyCodeEvent {
  const CertifyCodeRequested();
}

class CertifyCodeChanged extends CertifyCodeEvent {
  const CertifyCodeChanged({
    required this.code,
  });

  final String code;

  @override
  List<Object> get props => [code];
}

class CertifyCodeTimeOvered extends CertifyCodeEvent {
  const CertifyCodeTimeOvered();
}

class CertifyCodeSubmitted extends CertifyCodeEvent {
  const CertifyCodeSubmitted({
    required this.code,
  });

  final String code;

  @override
  List<Object> get props => [code];
}
