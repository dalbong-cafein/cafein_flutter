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

class SearchBloc extends Bloc<MapEvent, MapState> {
  SearchBloc({
    required this.userRepository,
    required this.storeRepository,
    required this.heartRepository,
  }) : super(const MapInitial()) {
    on<MapLocationRequested>(_onSearchLocationRequested);
    on<MapStoreRequested>(_onSearchStoreRequested);
    on<MapStoreHeartRequested>(_onSearchStoreHeartRequested);
    on<MapKeywordTaped>(_onSearchKeywordTabed);
  }

  final UserRepository userRepository;
  final StoreRepository storeRepository;
  final HeartRepository heartRepository;

  String currentLocation = '';

  List<Store> currentStores = [];

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

  FutureOr<void> _onSearchStoreRequested(
    MapStoreRequested event,
    Emitter<MapState> emit,
  ) async {
    if (event.location == currentLocation) {
      return;
    }
    currentLocation = event.location;

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
        stores: [...currentStores],
      ));
    } catch (e) {
      emit(MapError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onSearchKeywordTabed(
    MapKeywordTaped event,
    Emitter<MapState> emit,
  ) {
    var cur = currentStores;
    switch (event.searchKeyword) {
      case SearchKeyword.business:
        cur.sort(
          (a, b) {
            final isOpenA = a.businessInfo?.isOpen ?? false;

            return isOpenA ? -1 : 1;
          },
        );
        break;
      case SearchKeyword.confuse:
        cur.sort(
          (a, b) {
            final confuseScoreA = a.congestionScoreAvg ?? 0;
            final confuseScoreB = b.congestionScoreAvg ?? 0;

            return confuseScoreA < confuseScoreB ? -1 : 1;
          },
        );
        break;
      case SearchKeyword.close:
        cur.sort(
          (a, b) {
            final distanceA = calculateDistance(
              currentLatLng: currentLatLng,
              targetLatLng: LatLng(a.latY, a.lngX),
            );
            final distanceB = calculateDistance(
              currentLatLng: currentLatLng,
              targetLatLng: LatLng(b.latY, b.lngX),
            );

            return distanceA < distanceB ? -1 : 1;
          },
        );
        break;
      case SearchKeyword.recommended:
        cur.sort(
          (a, b) {
            final recommendedScoreA = a.recommendPercent ?? 0;
            final recommendedScoreB = b.recommendPercent ?? 0;

            return recommendedScoreA < recommendedScoreB ? -1 : 1;
          },
        );
        break;
    }

    currentStores = [...cur];
    emit(
      MapStoreLoaded(
        stores: [...currentStores],
      ),
    );
  }
}
