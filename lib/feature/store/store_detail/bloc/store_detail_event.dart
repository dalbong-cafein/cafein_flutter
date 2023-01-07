part of 'store_detail_bloc.dart';

abstract class StoreDetailEvent extends Equatable {
  const StoreDetailEvent();

  @override
  List<Object?> get props => [];
}

class StoreDetailRequested extends StoreDetailEvent {
  const StoreDetailRequested();
}

class StoreDetailScrollChanged extends StoreDetailEvent {
  const StoreDetailScrollChanged({
    required this.offset,
  });

  final double offset;

  @override
  List<Object?> get props => [offset];
}

class StoreDetailHeartRequested extends StoreDetailEvent {
  const StoreDetailHeartRequested({
    required this.isHeart,
  });

  final bool isHeart;

  @override
  List<Object?> get props => [
        isHeart,
      ];
}

class StoreDetailNearStoreRequested extends StoreDetailEvent {
  const StoreDetailNearStoreRequested();
}

class StoreDetailNearStoreHeartRequested extends StoreDetailEvent {
  const StoreDetailNearStoreHeartRequested({
    required this.isHeart,
    required this.index,
  });

  final bool isHeart;
  final int index;

  @override
  List<Object?> get props => [
        index,
        isHeart,
      ];
}

class StoreDetailTabChanged extends StoreDetailEvent {
  const StoreDetailTabChanged({
    required this.index,
    required this.isTaped,
  });

  final int index;
  final bool isTaped;

  @override
  List<Object?> get props => [
        index,
        isTaped,
      ];
}

class StoreDetailReviewRequested extends StoreDetailEvent {
  const StoreDetailReviewRequested();
}

class StoreDetailReviewReportClicked extends StoreDetailEvent {
  const StoreDetailReviewReportClicked({
    required this.reviewId,
  });
  final int reviewId;
}
