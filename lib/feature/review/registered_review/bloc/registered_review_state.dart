part of 'registered_review_bloc.dart';

abstract class RegisteredReviewState extends Equatable {
  const RegisteredReviewState();

  @override
  List<Object?> get props => [];
}

class RegisteredReviewInitial extends RegisteredReviewState {
  const RegisteredReviewInitial();
}

class RegisteredReviewLoading extends RegisteredReviewState {
  const RegisteredReviewLoading();
}

class RegisteredReviewLoaded extends RegisteredReviewState {
  const RegisteredReviewLoaded({
    required this.reviewCount,
    required this.reviewList,
  });

  final int reviewCount;
  final List<UserReview> reviewList;

  @override
  List<Object?> get props => [
        reviewCount,
        reviewList,
      ];
}

class RegisteredReviewError extends RegisteredReviewState {
  const RegisteredReviewError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
