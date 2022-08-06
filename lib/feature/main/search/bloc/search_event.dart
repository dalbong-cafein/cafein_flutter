part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchStoreRequested extends SearchEvent {
  const SearchStoreRequested({
    required this.location,
  });

  final String location;

  @override
  List<Object?> get props => [location];
}

class SearchPermissionRequested extends SearchEvent {
  const SearchPermissionRequested();
}

class SearchLocationRequested extends SearchEvent {
  const SearchLocationRequested();
}
