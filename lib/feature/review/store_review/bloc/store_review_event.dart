part of 'store_review_bloc.dart';

abstract class StoreReviewEvent extends Equatable {
  const StoreReviewEvent();

  @override
  List<Object?> get props => [];
}

class StoreReviewRequested extends StoreReviewEvent {
  const StoreReviewRequested();
}

class StoreReviewTypeChanged extends StoreReviewEvent {
  const StoreReviewTypeChanged({
    required this.isPhotoReviews,
  });

  final bool isPhotoReviews;

  @override
  List<Object?> get props => [
        isPhotoReviews,
      ];
}

class StoreReviewResetRequested extends StoreReviewEvent {
  const StoreReviewResetRequested();
}
