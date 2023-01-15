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

class MapStoreLoading extends MapState {
  const MapStoreLoading();
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

class MapFilterKeywordChecked extends MapState {
  const MapFilterKeywordChecked({
    required this.filterKeyword,
  });

  final MapFilterKeyword filterKeyword;

  @override
  List<Object?> get props => [filterKeyword];
}

class MapStoreLoaded extends MapState {
  const MapStoreLoaded({
    required this.stores,
    required this.keyword,
    this.isGoingToFirst = false,
    this.focusedIndex,
    this.isMoveCamera = false,
    required this.isHeart,
    this.storeId,
  });

  final List<Store> stores;
  final String keyword;
  final bool isGoingToFirst;
  final int? focusedIndex;
  final bool isMoveCamera;
  final bool? isHeart;
  final int? storeId;

  @override
  List<Object?> get props => [
        stores,
        keyword,
        isGoingToFirst,
        focusedIndex,
        isMoveCamera,
        isHeart,
        storeId,
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
    required this.latLngBounds,
    required this.centerLatLng,
  });

  final LatLngBounds latLngBounds;
  final LatLng centerLatLng;

  @override
  List<Object?> get props => [
        latLngBounds,
        centerLatLng,
      ];
}

class MapStoreDetailCallbackChecked extends MapState {
  const MapStoreDetailCallbackChecked({
    required this.index,
  });

  final int index;
  @override
  List<Object?> get props => [index];
}
