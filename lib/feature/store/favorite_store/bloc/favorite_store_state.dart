part of 'favorite_store_bloc.dart';


abstract class FavoriteStoreState extends Equatable{
  const FavoriteStoreState();
}

class FavoriteStoreInitial extends FavoriteStoreState {
  const FavoriteStoreInitial();

  @override
  List<Object?> get props => [];
}

class FavoriteStoreLoading extends FavoriteStoreState{
  const FavoriteStoreLoading();

  @override
  List<Object?> get props => [];
}

class FavoriteStoreLoaded extends FavoriteStoreState{
  const FavoriteStoreLoaded({required this.stores, required this.storeCount});
  final List<MemberStore> stores;
  final int storeCount;
  @override
  List<Object?> get props => [[...stores], storeCount];
}

class FavoriteStoreError extends FavoriteStoreState {
  const FavoriteStoreError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}