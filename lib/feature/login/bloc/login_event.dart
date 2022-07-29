part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSocialTokenRequested extends LoginEvent {
  const LoginSocialTokenRequested({
    required this.authProvider,
  });

  final AuthProvider authProvider;

  @override
  List<Object?> get props => [authProvider];
}

class LoginRequested extends LoginEvent {
  const LoginRequested({
    required this.socialLoginRequest,
  });

  final SocialLoginRequest socialLoginRequest;

  @override
  List<Object?> get props => [
        socialLoginRequest,
      ];
}
