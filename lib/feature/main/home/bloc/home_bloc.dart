import 'dart:async';
import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.stickerRepository,
    required this.heartRepository,
    required this.userRepository,
    required this.storeRepository,
  }) : super(const HomeInitial()) {
    on<HomeRequested>(_onHomeRequested);
    on<HomeRecommendStoreRequested>(_onHomeRecommendStoreRequested);
    on<HomeStoreHeartRequested>(_onHomeStoreHeartRequested);
  }

  final HeartRepository heartRepository;
  final StickerRepository stickerRepository;
  final UserRepository userRepository;
  final StoreRepository storeRepository;

  bool isGranted = false;

  List<Store> currentRecommendedStores = [];

  FutureOr<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      final stickerResponse = await stickerRepository.getStickerCount();
      final heartResponse = await heartRepository.getMyStores();

      final stickerCnt = stickerResponse.data;
      final memberStoreList = heartResponse.data.storeData;

      emit(HomeLoaded(
        stickerCnt: stickerCnt,
        memberStores: [...memberStoreList],
      ));
    } catch (e) {
      emit(HomeError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onHomeRecommendStoreRequested(
    HomeRecommendStoreRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    if (event.isGranted) {
      isGranted = true;
      try {
        final result = await Geolocator.getCurrentPosition();

        final currentLocation = await userRepository.getCurrentLocation(
          longitude: result.longitude,
          latitude: result.latitude,
        );

        final response = await storeRepository.getStores(currentLocation);
        currentRecommendedStores = response.data;

        emit(HomeRecommendStoreLoaded(
          recommendStores: [...currentRecommendedStores],
          isGranted: isGranted,
        ));
      } catch (e) {
        emit(HomeError(
          error: e,
          event: () => add(event),
        ));
      }
    } else {
      emit(
        HomeRecommendStoreLoaded(
          recommendStores: const [],
          isGranted: isGranted,
        ),
      );
    }
  }

  FutureOr<void> _onHomeStoreHeartRequested(
    HomeStoreHeartRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final cur = currentRecommendedStores;
      if (event.isLike) {
        await heartRepository.createHeart(
          currentRecommendedStores[event.index].storeId,
        );
      } else {
        await heartRepository.deleteHeart(
          currentRecommendedStores[event.index].storeId,
        );
      }

      cur[event.index] = cur[event.index].copyWith(isHeart: event.isLike);
      currentRecommendedStores = [...cur];

      emit(
        HomeRecommendStoreLoaded(
          recommendStores: [...currentRecommendedStores],
          isGranted: isGranted,
        ),
      );
    } catch (e) {
      emit(HomeError(
        event: () => add(event),
        error: e,
      ));
    }
  }
}
