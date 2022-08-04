part of 'home_bloc.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState{
  final int stickerCnt;
  final List<MemberStore> memberStores;
  const HomeLoaded({required this.stickerCnt, required this.memberStores});
  @override
  List<Object?> get props => [stickerCnt, memberStores];
}

class HomeError extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeRecommendStoreLoading extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeRecommendStoreLoaded extends HomeState{
  final List<Store> recommendStores;
  const HomeRecommendStoreLoaded({required this.recommendStores});
  @override
  List<Object?> get props => [recommendStores];
}

class HomeRecommendStoreError extends HomeState{
  @override
  List<Object?> get props => [];
}


class HomeMemberProfileLoaded extends HomeState{
  final Member member;
  const HomeMemberProfileLoaded({required this.member});
  @override
  List<Object?> get props => [member];
}

class HomeMemberProfileLoading extends HomeState{
  @override
  List<Object?> get props =>[];
}

class HomeMemberProfileError extends HomeState{
  @override
  List<Object?> get props => [];
}


