import 'dart:async';

import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/resource/resource.dart';
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

      final overlayImage = await OverlayImage.fromAssetImage(
        assetName: AppLottie.currentLocation,
      );

      final markers = [
        Marker(
          markerId: 'id',
          position: const LatLng(37.563600, 126.962370),
          captionText: "커스텀 아이콘",
          captionColor: AppColor.amber500,
          captionTextSize: 20.0,
          alpha: 0.8,
          captionOffset: 30,
          icon: overlayImage,
          anchor: AnchorPoint(0.5, 1),
          width: 45,
          height: 45,
          infoWindow: '인포 윈도우',
        )
      ];

      emit(SearchStoreLoaded(
        stores: response.data,
        markers: markers,
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
    emit(SearchViewTypeChecked(isCard: event.isCard));
  }
}
