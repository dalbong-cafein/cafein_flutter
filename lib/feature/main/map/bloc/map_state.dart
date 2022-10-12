part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {
  const MapInitial();
}

class MapLoading extends MapState {
  const MapLoading();
}

class MapError extends MapState {
  const MapError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class MapStoreLoaded extends MapState {
  const MapStoreLoaded({
    required this.stores,
  });

  final List<Store> stores;

  @override
  List<Object?> get props => [
        stores,
      ];
}

class MapLocationChecked extends MapState {
  const MapLocationChecked({
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
