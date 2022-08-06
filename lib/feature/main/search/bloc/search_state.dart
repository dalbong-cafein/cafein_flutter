part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchError extends SearchState {
  const SearchError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class SearchStoreLoaded extends SearchState {
  const SearchStoreLoaded({
    required this.stores,
  });

  final List<Store> stores;

  @override
  List<Object?> get props => [stores];
}

class SearchPermissionChecked extends SearchState {
  const SearchPermissionChecked({
    required this.permissionStatus,
  });

  final PermissionStatus permissionStatus;

  @override
  List<Object?> get props => [permissionStatus];
}

class SearchLocationChecked extends SearchState {
  const SearchLocationChecked({
    required this.location,
  });

  final String location;

  @override
  List<Object?> get props => [location];
}
