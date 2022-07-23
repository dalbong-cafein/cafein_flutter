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
    on<HomeRequested>((event, emit) {

    });
  }

  final HeartRepository heartRepository;
  final StickerRepository stickerRepository;

  FutureOr<void> _onHomeRequested(HomeRequested event, Emitter<HomeState> emit) async{
    emit(HomeLoading());
    try{

    }catch(e){
      emit(HomeError());
    }
  }



}
