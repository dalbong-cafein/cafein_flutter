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
    required this.keyword,
  });

  final List<Store> stores;
  final String keyword;

  @override
  List<Object?> get props => [
        stores,
        keyword,
      ];
}

class MapLocationChecked extends MapState {
  const MapLocationChecked({
    required this.location,
    required this.latitude,
    required this.longitude,
    this.isInitialChecked = false,
  });

  final String location;
  final double latitude;
  final double longitude;
  final bool isInitialChecked;

  @override
  List<Object?> get props => [
        location,
        latitude,
        longitude,
        isInitialChecked,
      ];
}

class MapCameraPositionChecked extends MapState {
  const MapCameraPositionChecked({
    required this.isDifferentLocation,
    required this.location,
  });

  final bool isDifferentLocation;
  final String location;

  @override
  List<Object?> get props => [
        isDifferentLocation,
        location,
      ];
}
