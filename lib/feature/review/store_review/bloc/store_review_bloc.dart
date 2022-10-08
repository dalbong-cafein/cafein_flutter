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
  }

  final int storeId;
  final ReviewRepository reviewRepository;

  int totalCount = 0;

  List<StoreReview> totalReviews = [];
  List<StoreReview>? photoReviews;

  FutureOr<void> _onStoreReviewRequested(
    StoreReviewRequested event,
    Emitter<StoreReviewState> emit,
  ) async {
    emit(const StoreReviewLoading());

    try {
      final response = await reviewRepository.getStoreReviews(storeId);

      if (response.code == -1) {
        emit(
          StoreReviewError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      totalReviews = [...response.data.reviewData.reviewList];
      totalCount = response.data.reviewCnt;

      emit(
        StoreReviewLoaded(
          storeReviewList: [...totalReviews],
          totalCount: totalCount,
          isPhotoReview: false,
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
    if (!event.isPhotoReviews) {
      emit(StoreReviewLoaded(
        storeReviewList: [...totalReviews],
        totalCount: totalCount,
        isPhotoReview: event.isPhotoReviews,
      ));

      return null;
    }

    photoReviews ??= totalReviews
        .where(
          (e) => (e.imageIdPairs ?? []).isNotEmpty,
        )
        .toList();

    emit(StoreReviewLoaded(
      storeReviewList: [...photoReviews!],
      totalCount: totalCount,
      isPhotoReview: event.isPhotoReviews,
    ));
  }
}
