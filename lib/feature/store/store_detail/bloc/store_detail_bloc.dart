import 'dart:async';

import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/event/event.dart';
import 'package:cafein_flutter/data/model/review/review_response.dart';
import 'package:cafein_flutter/data/model/review/review_score_detail.dart';
import 'package:cafein_flutter/data/model/review/store_review_list_response.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
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
    required this.heartRepository,
    required this.boardRepository,
    required this.storeId,
  }) : super(const StoreDetailInitial()) {
    on<StoreDetailRequested>(_onStoreDetailRequested);
    on<StoreDetailHeartRequested>(_onStoreDetailHeartRequested);
    on<StoreDetailTabChanged>(_onStoreDetailTabChanged);
    on<StoreDetailNearStoreRequested>(_onStoreDetailNearStoreRequested);
    on<StoreDetailNearStoreHeartRequested>(
        _onStoreDetailNearStoreHeartRequested);
    on<StoreDetailScrollChanged>(_onStoreDetailScrollChanged);
    on<StoreDetailReviewRequested>(_onStoreDetailReviewRequested);
    on<StoreDetailReviewReportClicked>(_onStoreDetailReviewReportClicked);
  }

  final StoreRepository storeRepository;
  final ReviewRepository reviewRepository;
  final HeartRepository heartRepository;
  final BoardRepository boardRepository;

  final int storeId;

  bool isHeart = false;

  String storeName = '';

  List<Store> nearStoreList = [];

  StoreDetail? storeDetail;
  Event? lastEvent;

  ReviewResponse? reviewResponse;
  ReviewDetailScore? reviewDetailScore;

  FutureOr<void> _onStoreDetailRequested(
    StoreDetailRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());

    try {
      final storeDetailResponse = storeRepository.getStoreDetail(
        storeId,
      );
      final reviewScoreResponse = reviewRepository.getStoreReviewScoreDetail(
        storeId,
      );

      final reviewResponse = reviewRepository.getStoreReviews(
        storeId: storeId,
        page: 1,
        size: 3,
      );

      final eventResponse = boardRepository.getLatestEvent();

      final responseList = await Future.wait<BaseResponse<dynamic>>([
        storeDetailResponse,
        reviewScoreResponse,
        reviewResponse,
        eventResponse,
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

      storeDetail = responseList[0].data;
      lastEvent = responseList[3].data;

      emit(
        StoreDetailLoaded(
          storeDetail: storeDetail!,
          reviewDetailScore: responseList[1].data,
          reviewResponse: responseList[2].data,
          latestEvent: lastEvent!,
        ),
      );

      isHeart = (responseList[0].data as StoreDetail).isHeart;
      storeName = (responseList[0].data as StoreDetail).storeName;

      emit(
        StoreDetailHeartChecked(
          isHeart: isHeart,
          isInitial: true,
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

  FutureOr<void> _onStoreDetailHeartRequested(
    StoreDetailHeartRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());

    try {
      if (event.isHeart) {
        await heartRepository.createHeart(
          storeId,
        );
      } else {
        await heartRepository.deleteHeart(
          storeId,
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

  FutureOr<void> _onStoreDetailTabChanged(
    StoreDetailTabChanged event,
    Emitter<StoreDetailState> emit,
  ) {
    emit(
      StoreDetailTabChecked(
        index: event.index,
        isTaped: event.isTaped,
      ),
    );
  }

  FutureOr<void> _onStoreDetailNearStoreRequested(
    StoreDetailNearStoreRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());
    try {
      final nearStoresResponse = await storeRepository.getNearStoreList(
        storeId,
      );

      nearStoreList = nearStoresResponse.data;
      emit(
        StoreDetailNearStoreLoaded(
          storeList: nearStoreList,
          isHeart: null,
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

  FutureOr<void> _onStoreDetailNearStoreHeartRequested(
    StoreDetailNearStoreHeartRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());
    try {
      final nearStoreId = nearStoreList[event.index].storeId;

      if (event.isHeart) {
        await heartRepository.createHeart(
          nearStoreId,
        );
      } else {
        await heartRepository.deleteHeart(
          nearStoreId,
        );
      }

      final cur = nearStoreList;
      cur[event.index] = cur[event.index].copyWith(
        isHeart: event.isHeart,
      );

      nearStoreList = [...cur];

      emit(
        StoreDetailNearStoreLoaded(
          storeList: nearStoreList,
          isHeart: event.isHeart,
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

  FutureOr<void> _onStoreDetailScrollChanged(
    StoreDetailScrollChanged event,
    Emitter<StoreDetailState> emit,
  ) {
    emit(StoreDetailScrollChecked(offset: event.offset));
  }

  FutureOr<void> _onStoreDetailReviewRequested(
    StoreDetailReviewRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    try {
      final reviewScoreResponse = reviewRepository.getStoreReviewScoreDetail(
        storeId,
      );

      var reviewResponse = reviewRepository.getStoreReviews(
        storeId: storeId,
        page: 1,
        size: 3,
      );

      final responseList = await Future.wait<BaseResponse<dynamic>>([
        reviewScoreResponse,
        reviewResponse,
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
      reviewResponse = responseList[1].data;
      reviewDetailScore = responseList[0].data;
      emit(
        StoreDetailLoaded(
          storeDetail: storeDetail!,
          reviewDetailScore: responseList[0].data,
          reviewResponse: responseList[1].data,
          latestEvent: lastEvent!,
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
  Future<FutureOr<void>> _onStoreDetailReviewReportClicked(
      StoreDetailReviewReportClicked event,
      Emitter<StoreDetailState> emit
      ) async {
    final response = await reviewRepository.getReportPossible(reviewId: event.reviewId);
    bool isPossibleRegistration = response.data.isPossibleRegistration;
    if(!isPossibleRegistration){
      emit(StoreDetailReviewReportOverlap(isPossibleRegistration: isPossibleRegistration));
      //emit(StoreDetailLoaded(storeDetail: storeDetail!, reviewDetailScore: reviewDetailScore!, reviewResponse: reviewResponse!, latestEvent: lastEvent!));
    }else{
      //emit(StoreDetailLoaded(storeDetail: storeDetail!, reviewDetailScore: reviewDetailScore!, reviewResponse: reviewResponse!, latestEvent: lastEvent!));
    }
  }
}
