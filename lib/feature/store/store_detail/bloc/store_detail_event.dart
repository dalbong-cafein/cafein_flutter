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
