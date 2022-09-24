part of 'store_detail_bloc.dart';

abstract class StoreDetailEvent extends Equatable {
  const StoreDetailEvent();

  @override
  List<Object?> get props => [];
}

class StoreDetailRequested extends StoreDetailEvent {
  const StoreDetailRequested();
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

class StoreDetailCongestionRequested extends StoreDetailEvent {
  const StoreDetailCongestionRequested({
    required this.day,
  });

  final String day;

  @override
  List<Object?> get props => [
        day,
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
  });

  final int index;

  @override
  List<Object?> get props => [index];
}
