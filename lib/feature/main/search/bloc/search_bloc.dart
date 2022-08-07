import 'dart:async';

import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.userRepository,
    required this.storeRepository,
  }) : super(const SearchInitial()) {
    on<SearchPermissionRequested>(_onSearchPermissionRequested);
    on<SearchLocationRequested>(_onSearchLocationRequested);
    on<SearchStoreRequested>(_onSearchStoreRequested);
    on<SearchViewTypeChanged>(_onSearchViewTypeChanged);
  }

  final UserRepository userRepository;
  final StoreRepository storeRepository;

  String currentLocation = '';

  List<Store> currentStores = [];
  List<Marker> currentMarker = [];
  bool isCard = false;

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
      currentMarker = [];

      emit(SearchStoreLoaded(
        stores: [...currentStores],
        markers: [...currentMarker],
        isCard: isCard,
      ));
    } catch (e) {
      emit(SearchError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onSearchPermissionRequested(
    SearchPermissionRequested event,
    Emitter<SearchState> emit,
  ) async {
    final status = await Permission.locationWhenInUse.request();
    emit(SearchPermissionChecked(permissionStatus: status));
  }

  FutureOr<void> _onSearchViewTypeChanged(
    SearchViewTypeChanged event,
    Emitter<SearchState> emit,
  ) {
    isCard = event.isCard;
    emit(SearchStoreLoaded(
      stores: [...currentStores],
      markers: [...currentMarker],
      isCard: isCard,
    ));
  }
}
