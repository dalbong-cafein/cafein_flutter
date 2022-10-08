part of 'store_review_bloc.dart';

abstract class StoreReviewState extends Equatable {
  const StoreReviewState();

  @override
  List<Object?> get props => [];
}

class StoreReviewInitial extends StoreReviewState {
  const StoreReviewInitial();
}

class StoreReviewLoading extends StoreReviewState {
  const StoreReviewLoading();
}

class StoreReviewLoaded extends StoreReviewState {
  const StoreReviewLoaded({
    required this.storeReviewList,
    required this.totalCount,
    required this.isPhotoReview,
  });

  final List<StoreReview> storeReviewList;
  final int totalCount;
  final bool isPhotoReview;

  @override
  List<Object?> get props => [
        storeReviewList,
        totalCount,
        isPhotoReview,
      ];
}

class StoreReviewError extends StoreReviewState {
  const StoreReviewError({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [error];
}
