part of 'registered_store_bloc.dart';

abstract class RegisteredStoreState extends Equatable {
  const RegisteredStoreState();

  @override
  List<Object?> get props => [];
}

class RegisteredStoreInitial extends RegisteredStoreState {
  const RegisteredStoreInitial();
}

class RegisteredStoreLoading extends RegisteredStoreState {
  const RegisteredStoreLoading();
}

class RegisteredStoreError extends RegisteredStoreState {
  const RegisteredStoreError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class RegisteredStoreLoaded extends RegisteredStoreState {
  const RegisteredStoreLoaded({
    required this.storeList,
    required this.storeCount,
  });

  final List<RegisteredStore> storeList;
  final int storeCount;

  @override
  List<Object?> get props => [
        storeList,
        storeCount,
      ];
}
