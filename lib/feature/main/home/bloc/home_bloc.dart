import 'dart:async';
import 'package:cafein_flutter/data/model/member/member.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.stickerRepository , required this.heartRepository, required this.userRepository, required this.storeRepository}) : super(HomeInitial()) {
    on<HomeRequested>(_onHomeRequested);
    on<HomeRecommendStoreRequested>(_onHomeRecommendStoreRequested);
    on<HomeMemberProfileRequested>(_onHomeMemberProfileRequested);
  }

  final HeartRepository heartRepository;
  final StickerRepository stickerRepository;
  final UserRepository userRepository;
  final StoreRepository storeRepository;

  FutureOr<void> _onHomeRequested(HomeRequested event, Emitter<HomeState> emit) async{
    emit(HomeLoading());
    try{
      final stickerResponse = await stickerRepository.getStickerCount();
      final stickerCnt = stickerResponse.data;
      final heartResponse = await heartRepository.getMyStores();
      final memberstoreList = heartResponse.data.storeData;
      emit(HomeLoaded(stickerCnt: stickerCnt, memberStores: [...memberstoreList]));
    }catch(e){
      emit(HomeError());
    }
  }

  FutureOr<void> _onHomeMemberProfileRequested(HomeMemberProfileRequested event , Emitter<HomeState> emit) async{
    emit(HomeMemberProfileLoading());
    try{
      final member = await userRepository.getMember();
      final memberProfile = member.data;
      emit(HomeMemberProfileLoaded(member: memberProfile));
    }catch(e){
      emit(HomeMemberProfileError());
    }
  }

  FutureOr<void> _onHomeRecommendStoreRequested(HomeRecommendStoreRequested event, Emitter<HomeState> emit) async{
    emit(HomeRecommendStoreLoading());
    try{
      final response = await storeRepository.getStores("노원구");
      final storeList = response.data;
      emit(HomeRecommendStoreLoaded(recommendStores: storeList));
    }catch(e){
      emit(HomeRecommendStoreError());
    }
  }



}
