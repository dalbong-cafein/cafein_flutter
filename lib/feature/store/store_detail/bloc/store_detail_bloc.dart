import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/event/event.dart';
import 'package:cafein_flutter/data/model/review/review_response.dart';
import 'package:cafein_flutter/data/model/review/review_score_detail.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

part 'store_detail_event.dart';

part 'store_detail_state.dart';

class StoreDetailBloc extends Bloc<StoreDetailEvent, StoreDetailState> {
  StoreDetailBloc(
      {required this.storeRepository,
      required this.reviewRepository,
      required this.heartRepository,
      required this.boardRepository,
      required this.storeId,
      required this.stickerRepository,
      required this.userRepository})
      : super(const StoreDetailInitial()) {
    on<StoreDetailRequested>(_onStoreDetailRequested);
    on<StoreDetailHeartRequested>(_onStoreDetailHeartRequested);
    on<StoreDetailTabChanged>(_onStoreDetailTabChanged);
    on<StoreDetailNearStoreRequested>(_onStoreDetailNearStoreRequested);
    on<StoreDetailNearStoreHeartRequested>(
        _onStoreDetailNearStoreHeartRequested);
    on<StoreDetailScrollChanged>(_onStoreDetailScrollChanged);
    on<StoreDetailReviewRequested>(_onStoreDetailReviewRequested);
    on<StoreDetailReviewReportClicked>(_onStoreDetailReviewReportClicked);
    on<StoreDetailReviewCreateClicked>(_onStoreDetailReviewCreateClicked);
  }

  final StoreRepository storeRepository;
  final ReviewRepository reviewRepository;
  final HeartRepository heartRepository;
  final BoardRepository boardRepository;
  final StickerRepository stickerRepository;
  final UserRepository userRepository;

  final int storeId;

  bool isHeart = false;

  String storeName = '';

  List<Store> nearStoreList = [];

  LatLng currentLatLng = CafeinConst.defaultLating;

  StoreDetail? storeDetail;
  Event? lastEvent;

  FutureOr<void> _onStoreDetailRequested(
    StoreDetailRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());

    try {
      final result = await Geolocator.getCurrentPosition();

      currentLatLng = LatLng(
        result.latitude,
        result.longitude,
      );

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
      Emitter<StoreDetailState> emit) async {
    try {
      final response =
          await reviewRepository.getReportPossible(reviewId: event.reviewId);
      bool isPossibleRegistration = response.data.isPossibleRegistration;
      if (!isPossibleRegistration) {
        emit(StoreDetailReviewReportOverlap(
            isPossibleRegistration: isPossibleRegistration));
      } else {}
    } catch (e) {
      emit(
        StoreDetailError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  Future<FutureOr<void>> _onStoreDetailReviewCreateClicked(
      StoreDetailReviewCreateClicked event,
      Emitter<StoreDetailState> emit) async {
    try {
      final response = await reviewRepository.isPossible(event.storeId);
      final isPossible = response.data.isPossibleRegistration;
      final deniedReason = response.data.reason;
      emit(StoreDetailReviewCreatePossible(
          isCreatePossible: isPossible,
          recommendation: event.recommendation,
          reviewDeniedReason: deniedReason));
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
