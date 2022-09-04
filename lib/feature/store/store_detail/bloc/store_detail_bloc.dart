import 'dart:async';
import 'dart:developer';

import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';
import 'package:cafein_flutter/data/model/review/review_score_detail.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/repository/congestion_repository.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_detail_event.dart';
part 'store_detail_state.dart';

class StoreDetailBloc extends Bloc<StoreDetailEvent, StoreDetailState> {
  StoreDetailBloc({
    required this.storeRepository,
    required this.reviewRepository,
    required this.congestionRepository,
    required this.heartRepository,
  }) : super(const StoreDetailInitial()) {
    on<StoreDetailRequested>(_onStoreDetailRequested);
    on<StoreDetailHeartRequested>(_onStoreDetailHeartRequested);
  }

  final StoreRepository storeRepository;
  final CongestionRepository congestionRepository;
  final ReviewRepository reviewRepository;
  final HeartRepository heartRepository;

  bool isHeart = false;

  FutureOr<void> _onStoreDetailRequested(
    StoreDetailRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());

    try {
      final storeDetailResponse = storeRepository.getStoreDetail(
        event.storeId,
      );

      final nearStoresResponse = storeRepository.getNearStoreList(
        event.storeId,
      );

      final reviewResponse = reviewRepository.getStoreReviewScoreDetail(
        event.storeId,
      );

      final congestionResponse = congestionRepository.getCongestions(
        storeId: event.storeId,
        minusDays: 1,
      );

      final responseList = await Future.wait<BaseResponse<dynamic>>([
        storeDetailResponse,
        nearStoresResponse,
        reviewResponse,
        congestionResponse,
      ]);

      for (final response in responseList) {
        if (response.code == -1) {
          emit(
            StoreDetailError(
              error: Error(),
              event: () => add(event),
            ),
          );

          return;
        }
      }

      emit(
        StoreDetailLoaded(
          storeDetail: responseList[0].data,
          storeList: responseList[1].data,
          reviewDetailScore: responseList[2].data,
          congestionResponse: responseList[3].data,
        ),
      );

      isHeart = (responseList[0].data as StoreDetail).isHeart;
      emit(
        StoreDetailHeartChecked(
          isHeart: isHeart,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(
        StoreDetailError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onStoreDetailHeartRequested(
    StoreDetailHeartRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());

    try {
      if (event.isHeart) {
        await heartRepository.createHeart(
          event.storeId,
        );
      } else {
        await heartRepository.deleteHeart(
          event.storeId,
        );
      }

      isHeart = event.isHeart;

      emit(
        StoreDetailHeartChecked(
          isHeart: isHeart,
        ),
      );
    } catch (e) {
      emit(
        StoreDetailError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
