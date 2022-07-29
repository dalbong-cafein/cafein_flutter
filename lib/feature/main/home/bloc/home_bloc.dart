import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/feature/notice/bloc/notice_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/store/store.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.stickerRepository , required this.heartRepository}) : super(HomeInitial()) {
    on<HomeRequested>(_onHomeRequested);
    on<HomeRecommendStoreRequested>(_onHomeRecommendStoreRequested);
  }

  final HeartRepository heartRepository;
  final StickerRepository stickerRepository;

  FutureOr<void> _onHomeRequested(HomeRequested event, Emitter<HomeState> emit) async{
    emit(HomeLoading());
    try{
      final heartResponse = await heartRepository.getMyStores();
      //final memberstoreList = heartResponse.data.storeData<List<MemberStore>>;
      final memberstoreList = [];
      final stickerResponse = await stickerRepository.getStickerCount();
      final stickerCnt = stickerResponse.data;
      emit(HomeLoaded(stickerCnt: stickerCnt, memberStores: [...memberstoreList]));
    }catch(e){
      emit(HomeError());
    }
  }

  FutureOr<void> _onHomeRecommendStoreRequested(HomeRecommendStoreRequested event, Emitter<HomeState> emit) async{
    emit(HomeRecommendStoreLoading());
    try{

    }catch(e){
      emit(HomeRecommendStoreError());
    }
  }



}
