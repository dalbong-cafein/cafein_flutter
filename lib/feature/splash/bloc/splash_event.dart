part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

class SplashLoginRequested extends SplashEvent {
  const SplashLoginRequested();
}
