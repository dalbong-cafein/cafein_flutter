import 'dart:async';

import 'package:cafein_flutter/data/model/review/user_review.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registered_review_event.dart';
part 'registered_review_state.dart';

class RegisteredReviewBloc
    extends Bloc<RegisteredReviewEvent, RegisteredReviewState> {
  RegisteredReviewBloc({
    required this.reviewRepository,
  }) : super(const RegisteredReviewInitial()) {
    on<RegisteredReviewRequested>(_onRegisteredReviewRequested);
  }

  final ReviewRepository reviewRepository;

  FutureOr<void> _onRegisteredReviewRequested(
    RegisteredReviewRequested event,
    Emitter<RegisteredReviewState> emit,
  ) async {
    emit(const RegisteredReviewLoading());
    try {
      final response = await reviewRepository.getUserReviews();

      if (response.code == -1) {
        emit(
          RegisteredReviewError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(RegisteredReviewLoaded(
        reviewCount: response.data.reviewCnt,
        reviewList: response.data.reviewData,
      ));
    } catch (e) {
      emit(
        RegisteredReviewError(
          error: e,
          event: () => add(
            event,
          ),
        ),
      );
    }
  }
}
