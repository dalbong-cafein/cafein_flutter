import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorite_store_event.dart';
part 'favorite_store_state.dart';

class FavoriteStoreBloc extends Bloc<FavoriteStoreEvent, FavoriteStoreState> {
  FavoriteStoreBloc({required this.heartRepository}) : super(const FavoriteStoreInitial()) {
    on<FavoriteStoreRequested>(_onFavoriteStoreRequested);
    on<FavoriteStoreClicked>(_onFavoriteStoreClicked);
  }
  final HeartRepository heartRepository;
  List<MemberStore> favoriteStores = [];
  int favoriteStoreCount = 0;
  FutureOr<void> _onFavoriteStoreRequested(
      FavoriteStoreRequested event,
      Emitter<FavoriteStoreState> emit,
      ) async {
    emit(const FavoriteStoreLoading());
    try {
      final storeResponse = await heartRepository.getMyStores();
      final stores = storeResponse.data.storeData;
      final storeCount = storeResponse.data.storeCnt;
      favoriteStores = stores;
      favoriteStoreCount = storeCount;
      emit(FavoriteStoreLoaded(stores: [...stores], storeCount: storeCount));
    } catch (e) {
      emit(FavoriteStoreError(
        error: e,
        event: () => add(event),
      ));
    }
  }


  FutureOr<void> _onFavoriteStoreClicked(
      FavoriteStoreClicked event,
      Emitter<FavoriteStoreState> emit,
      ) async {
    emit(const FavoriteStoreLoading());
    try {
      heartRepository.deleteHeart(event.clickedStoreId);
      emit(FavoriteStoreLoaded(stores: [...favoriteStores], storeCount: favoriteStoreCount));
    } catch (e) {
      emit(FavoriteStoreError(
        error: e,
        event: () => add(event),
      ));
    }
  }

}
