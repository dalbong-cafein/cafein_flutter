import 'dart:async';

import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
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
  }

  final UserRepository userRepository;
  final StoreRepository storeRepository;

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
        SearchLocationChecked(location: currentLocation),
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
    emit(const SearchLoading());
    try {
      final response = await storeRepository.getStores(event.location);
      if (response.code == -1) {
        emit(SearchError(
          error: Error(),
          event: () => add(event),
        ));

        return;
      }

      emit(SearchStoreLoaded(
        stores: response.data,
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
}
