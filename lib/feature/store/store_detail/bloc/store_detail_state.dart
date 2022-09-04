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

class StoreDetailLoaded extends StoreDetailState {
  const StoreDetailLoaded({
    required this.storeDetail,
    required this.storeList,
    required this.reviewDetailScore,
    required this.congestionResponse,
  });

  final StoreDetail storeDetail;
  final List<Store> storeList;
  final ReviewDetailScore reviewDetailScore;
  final CongestionResponse congestionResponse;

  @override
  List<Object?> get props => [
        storeDetail,
        storeList,
        reviewDetailScore,
        congestionResponse,
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
