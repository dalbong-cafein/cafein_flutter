import 'dart:async';

import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_review_event.dart';
part 'store_review_state.dart';

class StoreReviewBloc extends Bloc<StoreReviewEvent, StoreReviewState> {
  StoreReviewBloc({
    required this.reviewRepository,
    required this.storeId,
  }) : super(const StoreReviewInitial()) {
    on<StoreReviewRequested>(_onStoreReviewRequested);
    on<StoreReviewTypeChanged>(_onStoreReviewTypeChanged);
    on<StoreReviewResetRequested>(_onStoreReviewResetRequested);
    on<StoreReviewReportClicked>(_onStoreReviewReportClicked);
  }

  final int storeId;
  final ReviewRepository reviewRepository;

  int totalCount = 0;

  int nextPage = 1;

  bool hasNext = true;

  bool isPhotoReview = false;

  List<StoreReview> totalReviews = [];
  List<StoreReview> photoReviews = [];

  FutureOr<void> _onStoreReviewRequested(
    StoreReviewRequested event,
    Emitter<StoreReviewState> emit,
  ) async {
    emit(const StoreReviewLoading());

    try {
      final response = await reviewRepository.getStoreReviews(
        storeId: storeId,
        page: nextPage++,
        size: 20,
      );

      if (response.code == -1) {
        emit(
          StoreReviewError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      hasNext = response.data.reviewData.reviewList.length >= 20;

      totalReviews = [...response.data.reviewData.reviewList];

      totalCount = response.data.reviewCnt;

      photoReviews = totalReviews
          .where(
            (e) => (e.imageIdPairs ?? []).isNotEmpty,
          )
          .toList();

      emit(
        StoreReviewLoaded(
          storeReviewList:
              !isPhotoReview ? [...totalReviews] : [...photoReviews],
          totalCount: totalCount,
          isPhotoReview: isPhotoReview,
          nextPage: hasNext ? nextPage : null,
        ),
      );
    } catch (e) {
      emit(
        StoreReviewError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onStoreReviewTypeChanged(
    StoreReviewTypeChanged event,
    Emitter<StoreReviewState> emit,
  ) {
    isPhotoReview = event.isPhotoReviews;

    emit(StoreReviewLoaded(
      storeReviewList: !isPhotoReview ? [...totalReviews] : [...photoReviews],
      totalCount: totalCount,
      isPhotoReview: isPhotoReview,
      nextPage: hasNext ? nextPage : null,
    ));
  }

  FutureOr<void> _onStoreReviewResetRequested(
    StoreReviewResetRequested event,
    Emitter<StoreReviewState> emit,
  ) {
    totalCount = 0;
    nextPage = 1;
    hasNext = true;
    isPhotoReview = false;
    add(const StoreReviewRequested());
  }

  Future<FutureOr<void>> _onStoreReviewReportClicked(
      StoreReviewReportClicked event,
      Emitter<StoreReviewState> emit) async {
    try {
      final response =
      await reviewRepository.getReportPossible(reviewId: event.reviewId);
      bool isPossibleRegistration = response.data.isPossibleRegistration;
      if (!isPossibleRegistration) {
        emit(StoreReviewReportOverlap(
            isPossibleRegistration: isPossibleRegistration));
        emit(StoreReviewLoaded(
          storeReviewList: !isPhotoReview ? [...totalReviews] : [...photoReviews],
          totalCount: totalCount,
          isPhotoReview: isPhotoReview,
          nextPage: hasNext ? nextPage : null,
        ));
      } else {
        emit(StoreReviewLoaded(
          storeReviewList: !isPhotoReview ? [...totalReviews] : [...photoReviews],
          totalCount: totalCount,
          isPhotoReview: isPhotoReview,
          nextPage: hasNext ? nextPage : null,
        ));
      }
    } catch (e) {
      emit(
        StoreReviewError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }


}
