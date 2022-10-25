part of 'favorite_store_bloc.dart';

abstract class FavoriteStoreEvent extends Equatable {
  const FavoriteStoreEvent();
}

class FavoriteStoreRequested extends FavoriteStoreEvent {
  const FavoriteStoreRequested();

  @override
  List<Object?> get props => [];
}

class FavoriteStoreClicked extends FavoriteStoreEvent {
  final int clickedStoreId;
  final int clickedStoreIndex;

  const FavoriteStoreClicked(
      {required this.clickedStoreId, required this.clickedStoreIndex});

  @override
  List<Object?> get props => [];
}

class SortModeChanged extends FavoriteStoreEvent{
  final int sortMode;
  const SortModeChanged({required this.sortMode});

  @override
  List<Object?> get props => [];
}

class SortModeClicked extends FavoriteStoreEvent {
  const SortModeClicked({required this.sortMode});
  final int sortMode;
  @override
  List<Object?> get props => [];
}
