import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/enum/map_filter_keyword.dart';
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

  int? focusedIndex;

  LatLng currentLatLng = CafeinConst.defaultLating;

  FutureOr<void> _onSearchLocationRequested(
    MapLocationRequested event,
    Emitter<MapState> emit,
  ) async {
    emit(const MapLoading());
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
    emit(const MapStoreLoading());
    currentLocation = event.location;

    try {
      final response = await storeRepository.getStores(
        searchKeyword.isNotEmpty ? searchKeyword : currentLocation,
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
        focusedIndex: focusedIndex,
        isHeart: null,
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
    emit(const MapLoading());

    try {
      focusedIndex = event.index;
      final cur = currentStores;

      if (event.isLike) {
        await heartRepository.createHeart(cur[event.index].storeId);
      } else {
        await heartRepository.deleteHeart(cur[event.index].storeId);
      }

      cur[event.index] = cur[event.index].copyWith(
        isHeart: event.isLike,
        heartCnt: cur[event.index].heartCnt + (event.isLike ? 1 : -1),
      );

      currentStores = [...cur];

      emit(MapStoreLoaded(
        keyword: searchKeyword,
        stores: [...currentStores],
        focusedIndex: focusedIndex,
        isHeart: event.isLike,
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
  ) async {
    emit(const MapLoading());

    final cur = currentStores;

    switch (event.searchKeyword) {
      case MapFilterKeyword.business:
        cur.sort((a, b) {
          final isOpenB = b.businessInfo?.isOpen ?? false;

          return isOpenB ? 1 : -1;
        });

        break;
      case MapFilterKeyword.confuse:
        cur.sort((a, b) {
          final confuseScoreA = a.congestionScoreAvg ?? 0;
          final confuseScoreB = b.congestionScoreAvg ?? 0;

          return confuseScoreB.compareTo(confuseScoreA);
        });

        break;
      case MapFilterKeyword.close:
        cur.sort((a, b) {
          final distanceA = calculateDistance(
            currentLatLng: currentLatLng,
            targetLatLng: LatLng(a.latY, a.lngX),
          );
          final distanceB = calculateDistance(
            currentLatLng: currentLatLng,
            targetLatLng: LatLng(b.latY, b.lngX),
          );

          return distanceB.compareTo(distanceA);
        });

        break;
      case MapFilterKeyword.recommended:
        cur.sort((a, b) {
          final recommendedScoreA = a.recommendPercent ?? 0;
          final recommendedScoreB = b.recommendPercent ?? 0;

          return recommendedScoreB.compareTo(recommendedScoreA);
        });

        break;
      case MapFilterKeyword.none:
        add(MapStoreRequested(location: currentLocation));

        emit(MapFilterKeywordChecked(
          filterKeyword: event.searchKeyword,
        ));

        return;
    }

    currentStores = [...cur];

    emit(MapFilterKeywordChecked(
      filterKeyword: event.searchKeyword,
    ));

    emit(MapStoreLoaded(
      keyword: searchKeyword,
      stores: [...currentStores],
      isGoingToFirst: true,
      isHeart: null,
    ));
  }

  FutureOr<void> _onMapSearchResultChanged(
    MapSearchResultChanged event,
    Emitter<MapState> emit,
  ) {
    currentStores = [...event.storeList];
    searchKeyword = event.keyword;

    emit(
      MapStoreLoaded(
        stores: [...currentStores],
        keyword: searchKeyword,
        isHeart: null,
      ),
    );
  }

  FutureOr<void> _onMapSearchKeywordDeleteRequested(
    MapSearchKeywordDeleteRequested event,
    Emitter<MapState> emit,
  ) async {
    searchKeyword = '';
    emit(const MapStoreLoading());

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
        isHeart: null,
      ));
    } catch (e) {
      emit(MapError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onMapCameraPositionChanged(
    MapCameraPositionChanged event,
    Emitter<MapState> emit,
  ) async {
    emit(const MapLoading());
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
    emit(const MapLoading());
    try {
      final result = await Geolocator.getCurrentPosition();

      final userCurrentLocation = await userRepository.getCurrentLocation(
        longitude: result.longitude,
        latitude: result.latitude,
      );

      currentLatLng = LatLng(
        result.latitude,
        result.longitude,
      );

      currentLocation = userCurrentLocation;

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

    focusedIndex = event.focusedIndex;

    emit(
      MapStoreLoaded(
        stores: [...currentStores],
        keyword: searchKeyword,
        focusedIndex: focusedIndex,
        isMoveCamera: true,
        isHeart: null,
      ),
    );
  }
}
