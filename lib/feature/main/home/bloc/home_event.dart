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
  const HomeRecommendStoreRequested({
    required this.isGranted,
  });

  final bool isGranted;

  @override
  List<Object?> get props => [isGranted];
}

class HomeStoreHeartRequested extends HomeEvent {
  final int index;
  final bool isLike;

  const HomeStoreHeartRequested({
    required this.index,
    required this.isLike,
  });

  @override
  List<Object?> get props => [index];
}
