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
    required this.markers,
    required this.isCard,
  });

  final List<Store> stores;
  final List<Marker> markers;
  final bool isCard;

  @override
  List<Object?> get props => [
        stores,
        markers,
        isCard,
      ];
}

class SearchPermissionChecked extends SearchState {
  const SearchPermissionChecked({
    required this.permissionStatus,
  });

  final PermissionStatus permissionStatus;

  @override
  List<Object?> get props => [
        permissionStatus,
        DateTime.now(),
      ];
}

class SearchLocationChecked extends SearchState {
  const SearchLocationChecked({
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  final String location;
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
        location,
        latitude,
        longitude,
      ];
}
