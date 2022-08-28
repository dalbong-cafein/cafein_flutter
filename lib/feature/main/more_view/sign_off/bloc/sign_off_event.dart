part of 'sign_off_bloc.dart';

abstract class SignOffEvent extends Equatable {
  const SignOffEvent();

  @override
  List<Object?> get props => [];
}

class SignOffRequested extends SignOffEvent {
  const SignOffRequested();
}
