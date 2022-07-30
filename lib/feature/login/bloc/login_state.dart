part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();

  @override
  List<Object?> get props => [];
}

class LoginSocialTokenConfirmed extends LoginState {
  const LoginSocialTokenConfirmed({
    required this.socialLoginRequest,
  });

  final SocialLoginRequest socialLoginRequest;

  @override
  List<Object?> get props => [
        socialLoginRequest,
      ];
}

class LoginSucceed extends LoginState {
  const LoginSucceed({
    required this.isCertifiedPhone,
    required this.isRegisteredNickname,
  });

  final bool isCertifiedPhone;
  final bool isRegisteredNickname;

  @override
  List<Object?> get props => [
        isCertifiedPhone,
        isRegisteredNickname,
      ];
}

class LoginError extends LoginState {
  const LoginError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
