part of 'store_detail_bloc.dart';

abstract class StoreDetailEvent extends Equatable {
  const StoreDetailEvent();

  @override
  List<Object?> get props => [];
}

class StoreDetailRequested extends StoreDetailEvent {
  const StoreDetailRequested({
    required this.storeId,
  });

  final int storeId;

  @override
  List<Object?> get props => [storeId];
}

class StoreDetailHeartRequested extends StoreDetailEvent {
  const StoreDetailHeartRequested({
    required this.isHeart,
    required this.storeId,
  });

  final bool isHeart;
  final int storeId;

  @override
  List<Object?> get props => [
        isHeart,
        storeId,
      ];
}

class StoreDetailTabChanged extends StoreDetailEvent {
  const StoreDetailTabChanged({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}
