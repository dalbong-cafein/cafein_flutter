part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final int stickerCnt;
  final List<MemberStore> memberStores;

  const HomeLoaded({
    required this.stickerCnt,
    required this.memberStores,
  });

  @override
  List<Object?> get props => [stickerCnt, memberStores];
}

class HomeError extends HomeState {
  const HomeError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class HomeRecommendStoreLoaded extends HomeState {
  final List<Store> recommendStores;

  const HomeRecommendStoreLoaded({
    required this.recommendStores,
  });

  @override
  List<Object?> get props => [recommendStores];
}

class HomeMyStoreCreateLoading extends HomeState{

  @override
  List<Object?> get props => [];

}

class HomeMyStoreCreateLoaded extends HomeState{

  @override
  List<Object?> get props => [];

}

class HomeMyStoreCreateError extends HomeState{
  const HomeMyStoreCreateError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [];

}

class HomeMyStoreDeleteLoading extends HomeState{

  @override
  List<Object?> get props => [];

}

class HomeMyStoreDeleteLoaded extends HomeState{

  @override
  List<Object?> get props => [];

}

class HomeMyStoreDeleteError extends HomeState{

  const HomeMyStoreDeleteError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];

}