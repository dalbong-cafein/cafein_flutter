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
    required this.oAuthAccessToken,
    required this.oAuthProvider,
  });

  final String oAuthAccessToken;
  final String oAuthProvider;

  @override
  List<Object?> get props => [
        oAuthAccessToken,
        oAuthProvider,
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
    this.isNetworkError = false,
  });

  final bool isNetworkError;
  final Function event;

  @override
  List<Object?> get props => [isNetworkError];
}
