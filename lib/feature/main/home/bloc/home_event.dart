part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeRequested extends HomeEvent {
  const HomeRequested();

  @override
  List<Object?> get props => [];
}

class HomeRecommendStoreRequested extends HomeEvent {
  const HomeRecommendStoreRequested();

  @override
  List<Object?> get props => [];
}

class HomeMyStoreCreateRequested extends HomeEvent{
  final int storeId;
  const HomeMyStoreCreateRequested({required this.storeId});

  @override
  List<Object?> get props => [storeId];

}

class HomeMyStoreDeleteRequested extends HomeEvent{
  final int storeId;
  const HomeMyStoreDeleteRequested({required this.storeId});

  @override
  List<Object?> get props => [storeId];

}