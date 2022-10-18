part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoginChecked extends SplashState {
  const SplashLoginChecked();
}

class SplashPhoneChecked extends SplashState {
  const SplashPhoneChecked();
}

class SplashProfileChecked extends SplashState {
  const SplashProfileChecked();
}

class SplashOnboardChecked extends SplashState {
  const SplashOnboardChecked();
}

class SplashMainChecked extends SplashState {
  const SplashMainChecked();
}

class SplashError extends SplashState {
  const SplashError();
}
