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
