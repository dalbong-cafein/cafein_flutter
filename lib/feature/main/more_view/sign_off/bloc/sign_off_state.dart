part of 'sign_off_bloc.dart';

abstract class SignOffState extends Equatable {
  const SignOffState();

  @override
  List<Object?> get props => [];
}

class SignOffInitial extends SignOffState {
  const SignOffInitial();
}

class SignOffLoading extends SignOffState {
  const SignOffLoading();
}

class SignOffError extends SignOffState {
  const SignOffError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class SignOffSucceed extends SignOffState {
  const SignOffSucceed();
}
