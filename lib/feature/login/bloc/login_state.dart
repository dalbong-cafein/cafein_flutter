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
  const LoginSucceed();

  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  const LoginError();

  @override
  List<Object?> get props => [];
}
