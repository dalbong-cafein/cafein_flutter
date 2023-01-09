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
    this.nextPage,
  });

  final List<StoreReview> storeReviewList;
  final int totalCount;
  final bool isPhotoReview;
  final int? nextPage;

  @override
  List<Object?> get props => [
        storeReviewList,
        totalCount,
        isPhotoReview,
        nextPage,
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
class StoreReviewReportOverlap extends StoreReviewState {
  const StoreReviewReportOverlap({required this.isPossibleRegistration});

  final bool isPossibleRegistration;

  @override
  List<Object?> get props => [
    isPossibleRegistration
  ];
}