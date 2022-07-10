part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSocialTokenRequested extends LoginEvent {
  const LoginSocialTokenRequested({
    required this.oAuthProvider,
  });

  final String oAuthProvider;

  @override
  List<Object?> get props => [oAuthProvider];
}

class LoginRequested extends LoginEvent {
  const LoginRequested({
    required this.oAuthAccessToken,
    required this.oAuthProvider,
  });

  final String oAuthProvider;
  final String oAuthAccessToken;

  @override
  List<Object?> get props => [
        oAuthAccessToken,
        oAuthProvider,
      ];
}
