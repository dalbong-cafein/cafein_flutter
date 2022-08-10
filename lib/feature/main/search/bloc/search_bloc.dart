import 'dart:async';

import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.userRepository,
    required this.storeRepository,
    required this.heartRepository,
  }) : super(const SearchInitial()) {
    on<SearchLocationRequested>(_onSearchLocationRequested);
    on<SearchStoreRequested>(_onSearchStoreRequested);
    on<SearchStoreHeartRequested>(_onSearchStoreHeartRequested);
  }

  final UserRepository userRepository;
  final StoreRepository storeRepository;
  final HeartRepository heartRepository;

  String currentLocation = '';

  List<Store> currentStores = [];
  List<Marker> currentMarker = [];

  FutureOr<void> _onSearchLocationRequested(
    SearchLocationRequested event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final result = await Geolocator.getCurrentPosition();

      final currentLocation = await userRepository.getCurrentLocation(
        longitude: result.longitude,
        latitude: result.latitude,
      );

      emit(
        SearchLocationChecked(
          location: currentLocation,
          latitude: result.latitude,
          longitude: result.longitude,
        ),
      );
    } catch (e) {
      emit(SearchError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onSearchStoreRequested(
    SearchStoreRequested event,
    Emitter<SearchState> emit,
  ) async {
    if (event.location == currentLocation) {
      return;
    }
    currentLocation = event.location;

    emit(const SearchLoading());
    try {
      final response = await storeRepository.getStores(currentLocation);
      if (response.code == -1) {
        emit(SearchError(
          error: Error(),
          event: () => add(event),
        ));

        return;
      }

      currentStores = [...response.data];
      currentMarker = List.generate(
        response.data.length,
        (index) {
          late OverlayImage icon;
          final score = response.data[index].congestionScoreAvg ?? 0;
          if (score <= 1.5) {
            icon = CafeinConfig.confuseGoodIcon;
          } else if (score <= 2.5) {
            icon = CafeinConfig.confuseNormalIcon;
          } else {
            icon = CafeinConfig.confuseBadIcon;
          }

          return Marker(
            markerId: '${response.data[index].storeId}',
            position: LatLng(
              response.data[index].latY,
              response.data[index].lngX,
            ),
            icon: response.data[index].isHeart ? CafeinConfig.confuseHeartIcon : icon,
          );
        },
      );

      emit(SearchStoreLoaded(
        stores: [...currentStores],
        markers: [...currentMarker],
      ));
    } catch (e) {
      emit(SearchError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onSearchStoreHeartRequested(
    SearchStoreHeartRequested event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final cur = currentStores;

      if (event.isLike) {
        await heartRepository.createHeart(currentStores[event.index].storeId);
      } else {
        await heartRepository.deleteHeart(currentStores[event.index].storeId);
      }
      cur[event.index] = cur[event.index].copyWith(isHeart: event.isLike);
      currentStores = [...cur];

      currentMarker = List.generate(
        currentStores.length,
        (index) {
          late OverlayImage icon;
          final score = currentStores[index].congestionScoreAvg ?? 0;
          if (score <= 1.5) {
            icon = CafeinConfig.confuseGoodIcon;
          } else if (score <= 2.5) {
            icon = CafeinConfig.confuseNormalIcon;
          } else {
            icon = CafeinConfig.confuseBadIcon;
          }

          return Marker(
            markerId: '${currentStores[index].storeId}',
            position: LatLng(
              currentStores[index].latY,
              currentStores[index].lngX,
            ),
            icon: currentStores[index].isHeart ? CafeinConfig.confuseHeartIcon : icon,
          );
        },
      );

      emit(SearchStoreLoaded(
        stores: [...currentStores],
        markers: [...currentMarker],
      ));
    } catch (e) {
      emit(SearchError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
