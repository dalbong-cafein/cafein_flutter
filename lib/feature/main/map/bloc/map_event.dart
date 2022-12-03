part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class MapStoreRequested extends MapEvent {
  const MapStoreRequested({
    this.location,
    this.storeId,
    this.latLngBounds,
  });

  final String? location;
  final int? storeId;
  final LatLngBounds? latLngBounds;

  @override
  List<Object?> get props => [
        location,
        storeId,
        latLngBounds,
      ];
}

class MapLocationRequested extends MapEvent {
  const MapLocationRequested();
}

class MapStoreHeartRequested extends MapEvent {
  const MapStoreHeartRequested({
    required this.isLike,
    required this.index,
  });

  final bool isLike;
  final int index;

  @override
  List<Object?> get props => [isLike];
}

class MapKeywordTaped extends MapEvent {
  const MapKeywordTaped({
    required this.searchKeyword,
  });

  final MapFilterKeyword searchKeyword;

  @override
  List<Object?> get props => [searchKeyword];
}

class MapSearchResultChanged extends MapEvent {
  const MapSearchResultChanged({
    required this.storeList,
    required this.keyword,
  });

  final List<Store> storeList;
  final String keyword;

  @override
  List<Object?> get props => [
        storeList,
        keyword,
      ];
}

class MapSearchKeywordDeleteRequested extends MapEvent {
  const MapSearchKeywordDeleteRequested();
}

class MapCurrentLocationRequested extends MapEvent {
  const MapCurrentLocationRequested();
}

class MapFocusChanged extends MapEvent {
  const MapFocusChanged({
    required this.focusedIndex,
  });

  final int focusedIndex;

  @override
  List<Object?> get props => [focusedIndex];
}

class MapCameraPositionChanged extends MapEvent {
  const MapCameraPositionChanged({
    required this.latLngBounds,
  });

  final LatLngBounds latLngBounds;

  @override
  List<Object?> get props => [
        latLngBounds,
      ];
}

class MapStoreDetailCallbackRequested extends MapEvent {
  const MapStoreDetailCallbackRequested({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}
