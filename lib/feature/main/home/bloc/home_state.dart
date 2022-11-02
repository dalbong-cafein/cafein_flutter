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
  final String homeEventImageUrl;
  final int homeEventBoardId;

  const HomeLoaded({
    required this.stickerCnt,
    required this.memberStores,
    required this.homeEventImageUrl,
    required this.homeEventBoardId
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
  final bool isGranted;

  const HomeRecommendStoreLoaded({
    required this.recommendStores,
    required this.isGranted,
  });

  @override
  List<Object?> get props => [
        recommendStores,
        isGranted,
      ];
}

class HomeMyStoreCreateLoading extends HomeState {
  @override
  List<Object?> get props => [];
}
