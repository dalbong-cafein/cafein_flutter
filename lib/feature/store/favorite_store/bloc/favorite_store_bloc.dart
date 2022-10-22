import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorite_store_event.dart';

part 'favorite_store_state.dart';

class FavoriteStoreBloc extends Bloc<FavoriteStoreEvent, FavoriteStoreState> {
  FavoriteStoreBloc({required this.heartRepository})
      : super(const FavoriteStoreInitial()) {
    on<FavoriteStoreRequested>(_onFavoriteStoreRequested);
    on<FavoriteStoreClicked>(_onFavoriteStoreClicked);
    on<SortModeClicked>(_onSortModeClicked);
    on<SortModeChanged>(_onSortModeChanged);
  }

  final HeartRepository heartRepository;
  List<MemberStore> favoriteStores = [];
  List<bool> heartList = [];
  int favoriteStoreCount = 0;
  int sortMode = 0;

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
      heartList = List<bool>.filled(storeCount, true);
      emit(FavoriteStoreLoaded(
          stores: [...stores],
          storeCount: storeCount,
          heartList: [...heartList],
          sortMode: sortMode
      ));
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
      if (heartList[event.clickedStoreIndex]) {
        heartRepository.deleteHeart(event.clickedStoreId);
        heartList[event.clickedStoreIndex] = false;
      } else {
        heartRepository.createHeart(event.clickedStoreId);
        heartList[event.clickedStoreIndex] = true;
      }
      emit(FavoriteStoreLoaded(
          stores: [...favoriteStores],
          storeCount: favoriteStoreCount,
          heartList: [...heartList],
          sortMode: sortMode
      ));
    } catch (e) {
      emit(FavoriteStoreError(
        error: e,
        event: () => add(event),
      ));
    }
  }
  FutureOr<void> _onSortModeClicked(
      SortModeClicked event,
      Emitter<FavoriteStoreState> emit,
      ){
    emit(const SortModeSetting());
  }

  FutureOr<void> _onSortModeChanged(
      SortModeChanged event,
      Emitter<FavoriteStoreState> emit,
      ){

    if(event.sortMode == sortMode){ //기존 모드와 똑같이 했을
      emit(FavoriteStoreLoaded(
          stores: [...favoriteStores],
          storeCount: favoriteStoreCount,
          heartList: [...heartList],
          sortMode: sortMode
      ));
    }else{
      if(event.sortMode == 0){
        //등록순
      }if(event.sortMode == 1){
        //가까운순
      }else{
        //혼잡도 낮은 순
      }
    }


  }

}
