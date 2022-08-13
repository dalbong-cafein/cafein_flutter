import 'dart:async';

import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

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

      emit(SearchStoreLoaded(
        stores: [...currentStores],
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

      emit(SearchStoreLoaded(
        stores: [...currentStores],
      ));
    } catch (e) {
      emit(SearchError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
