part of 'registered_store_bloc.dart';

abstract class RegisteredStoreEvent extends Equatable {
  const RegisteredStoreEvent();

  @override
  List<Object?> get props => [];
}

class RegisteredStoreRequested extends RegisteredStoreEvent {
  const RegisteredStoreRequested();
}
