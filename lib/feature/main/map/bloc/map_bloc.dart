import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/enum/search_keyword.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/util/calculate_distance.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({
    required this.userRepository,
    required this.storeRepository,
    required this.heartRepository,
  }) : super(const MapInitial()) {
    on<MapLocationRequested>(_onSearchLocationRequested);
    on<MapStoreRequested>(_onSearchStoreRequested);
    on<MapStoreHeartRequested>(_onSearchStoreHeartRequested);
    on<MapKeywordTaped>(_onSearchKeywordTaped);
    on<MapSearchResultChanged>(_onMapSearchResultChanged);
    on<MapSearchKeywordDeleteRequested>(_onMapSearchKeywordDeleteRequested);
    on<MapCurrentLocationRequested>(_onMapCurrentLocationRequested);
    on<MapCameraPositionChanged>(_onMapCameraPositionChanged);
    on<MapFocusChanged>(_onMapFocusChanged);
  }

  final UserRepository userRepository;
  final StoreRepository storeRepository;
  final HeartRepository heartRepository;

  String currentLocation = '';
  String searchKeyword = '';

  List<Store> currentStores = [];

  List<Store> searchResultStoreList = [];

  bool isSearchResult = false;

  LatLng currentLatLng = CafeinConst.defaultLating;

  FutureOr<void> _onSearchLocationRequested(
    MapLocationRequested event,
    Emitter<MapState> emit,
  ) async {
    try {
      final result = await Geolocator.getCurrentPosition();

      final currentLocation = await userRepository.getCurrentLocation(
        longitude: result.longitude,
        latitude: result.latitude,
      );

      currentLatLng = LatLng(
        result.latitude,
        result.longitude,
      );

      emit(
        MapLocationChecked(
          isInitialChecked: true,
          location: currentLocation,
          latitude: result.latitude,
          longitude: result.longitude,
        ),
      );
    } catch (e) {
      emit(
        MapLocationChecked(
          isInitialChecked: true,
          location: CafeinConst.defaultLocation,
          latitude: CafeinConst.defaultLating.latitude,
          longitude: CafeinConst.defaultLating.longitude,
        ),
      );
    }
  }

  FutureOr<void> _onSearchStoreRequested(
    MapStoreRequested event,
    Emitter<MapState> emit,
  ) async {
    isSearchResult = false;

    if (event.location == currentLocation) {
      return;
    }

    currentLocation = event.location;
    searchKeyword = '';

    emit(const MapLoading());

    try {
      final response = await storeRepository.getStores(
        currentLocation,
      );
      if (response.code == -1) {
        emit(MapError(
          error: Error(),
          event: () => add(event),
        ));

        return;
      }

      currentStores = [...response.data];

      emit(MapStoreLoaded(
        keyword: searchKeyword,
        stores: [...currentStores],
      ));
    } catch (e) {
      emit(MapError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onSearchStoreHeartRequested(
    MapStoreHeartRequested event,
    Emitter<MapState> emit,
  ) async {
    try {
      final cur = currentStores;

      if (event.isLike) {
        await heartRepository.createHeart(
          currentStores[event.index].storeId,
        );
      } else {
        await heartRepository.deleteHeart(
          currentStores[event.index].storeId,
        );
      }

      cur[event.index] = cur[event.index].copyWith(
        isHeart: event.isLike,
      );

      currentStores = [...cur];

      emit(MapStoreLoaded(
        keyword: searchKeyword,
        stores: [...currentStores],
      ));
    } catch (e) {
      emit(MapError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onSearchKeywordTaped(
    MapKeywordTaped event,
    Emitter<MapState> emit,
  ) {
    emit(const MapLoading());
    final cur = isSearchResult ? searchResultStoreList : currentStores;
    switch (event.searchKeyword) {
      case SearchKeyword.business:
        cur.sort((a, b) {
          final isOpenA = a.businessInfo?.isOpen ?? false;

          return isOpenA ? -1 : 1;
        });
        break;
      case SearchKeyword.confuse:
        cur.sort((a, b) {
          final confuseScoreA = a.congestionScoreAvg ?? 0;
          final confuseScoreB = b.congestionScoreAvg ?? 0;

          return confuseScoreA < confuseScoreB ? -1 : 1;
        });
        break;
      case SearchKeyword.close:
        cur.sort((a, b) {
          final distanceA = calculateDistance(
            currentLatLng: currentLatLng,
            targetLatLng: LatLng(a.latY, a.lngX),
          );
          final distanceB = calculateDistance(
            currentLatLng: currentLatLng,
            targetLatLng: LatLng(b.latY, b.lngX),
          );

          return distanceA < distanceB ? -1 : 1;
        });
        break;
      case SearchKeyword.recommended:
        cur.sort((a, b) {
          final recommendedScoreA = a.recommendPercent ?? 0;
          final recommendedScoreB = b.recommendPercent ?? 0;

          return recommendedScoreA < recommendedScoreB ? -1 : 1;
        });
        break;
    }

    if (isSearchResult) {
      searchResultStoreList = [...cur];
    } else {
      currentStores = [...cur];
    }

    emit(
      MapStoreLoaded(
        keyword: searchKeyword,
        stores: [
          ...(isSearchResult ? searchResultStoreList : currentStores),
        ],
        isGoingToFirst: true,
      ),
    );
  }

  FutureOr<void> _onMapSearchResultChanged(
    MapSearchResultChanged event,
    Emitter<MapState> emit,
  ) {
    searchResultStoreList = event.storeList;
    searchKeyword = event.keyword;

    emit(
      MapStoreLoaded(
        stores: [...searchResultStoreList],
        keyword: searchKeyword,
      ),
    );
  }

  FutureOr<void> _onMapSearchKeywordDeleteRequested(
    MapSearchKeywordDeleteRequested event,
    Emitter<MapState> emit,
  ) {
    searchKeyword = '';

    emit(
      MapStoreLoaded(
        stores: [...currentStores],
        keyword: searchKeyword,
      ),
    );
  }

  FutureOr<void> _onMapCameraPositionChanged(
    MapCameraPositionChanged event,
    Emitter<MapState> emit,
  ) async {
    try {
      final responseLocation = await userRepository.getCurrentLocation(
        longitude: event.longitude,
        latitude: event.latitude,
      );

      emit(
        MapCameraPositionChecked(
          isDifferentLocation: currentLocation != responseLocation,
          location: responseLocation,
        ),
      );
    } catch (e) {
      emit(
        MapCameraPositionChecked(
          isDifferentLocation: false,
          location: currentLocation,
        ),
      );
    }
  }

  FutureOr<void> _onMapCurrentLocationRequested(
    MapCurrentLocationRequested event,
    Emitter<MapState> emit,
  ) async {
    try {
      final result = await Geolocator.getCurrentPosition();

      final currentLocation = await userRepository.getCurrentLocation(
        longitude: result.longitude,
        latitude: result.latitude,
      );

      currentLatLng = LatLng(
        result.latitude,
        result.longitude,
      );

      emit(
        MapLocationChecked(
          location: currentLocation,
          latitude: result.latitude,
          longitude: result.longitude,
        ),
      );
    } catch (e) {
      emit(MapError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onMapFocusChanged(
    MapFocusChanged event,
    Emitter<MapState> emit,
  ) {
    emit(const MapLoading());

    emit(
      MapStoreLoaded(
        stores:
            isSearchResult ? [...searchResultStoreList] : [...currentStores],
        keyword: searchKeyword,
        focusedIndex: event.focusedIndex,
      ),
    );
  }
}
