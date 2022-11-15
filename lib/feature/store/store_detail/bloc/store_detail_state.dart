part of 'store_detail_bloc.dart';

abstract class StoreDetailState extends Equatable {
  const StoreDetailState();

  @override
  List<Object?> get props => [];
}

class StoreDetailInitial extends StoreDetailState {
  const StoreDetailInitial();
}

class StoreDetailLoading extends StoreDetailState {
  const StoreDetailLoading();
}

class StoreDetailScrollChecked extends StoreDetailState {
  const StoreDetailScrollChecked({
    required this.offset,
  });

  final double offset;

  @override
  List<Object?> get props => [offset];
}

class StoreDetailLoaded extends StoreDetailState {
  const StoreDetailLoaded({
    required this.storeDetail,
    required this.reviewDetailScore,
    required this.reviewResponse,
    required this.latestEvent,
  });

  final StoreDetail storeDetail;
  final ReviewDetailScore reviewDetailScore;
  final ReviewResponse<StoreReviewListResponse> reviewResponse;
  final Event latestEvent;

  @override
  List<Object?> get props => [
        storeDetail,
        reviewDetailScore,
        reviewResponse,
        latestEvent,
      ];
}

class StoreDetailNearStoreLoaded extends StoreDetailState {
  const StoreDetailNearStoreLoaded({
    required this.storeList,
  });

  final List<Store> storeList;

  @override
  List<Object?> get props => [
        storeList,
      ];
}

class StoreDetailError extends StoreDetailState {
  const StoreDetailError({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [error];
}

class StoreDetailHeartChecked extends StoreDetailState {
  const StoreDetailHeartChecked({
    required this.isHeart,
  });

  final bool isHeart;

  @override
  List<Object?> get props => [isHeart];
}

class StoreDetailTabChecked extends StoreDetailState {
  const StoreDetailTabChecked({
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
