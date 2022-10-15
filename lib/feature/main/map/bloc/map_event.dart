part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class MapStoreRequested extends MapEvent {
  const MapStoreRequested({
    required this.location,
  });

  final String location;

  @override
  List<Object?> get props => [location];
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

  final SearchKeyword searchKeyword;

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

class MapCameraPositionChanged extends MapEvent {
  const MapCameraPositionChanged({
    required this.longitude,
    required this.latitude,
  });

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];
}
