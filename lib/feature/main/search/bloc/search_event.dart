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

class SearchLocationRequested extends SearchEvent {
  const SearchLocationRequested();
}

class SearchStoreHeartRequested extends SearchEvent {
  const SearchStoreHeartRequested({
    required this.isLike,
    required this.index,
  });

  final bool isLike;
  final int index;

  @override
  List<Object?> get props => [isLike];
}
