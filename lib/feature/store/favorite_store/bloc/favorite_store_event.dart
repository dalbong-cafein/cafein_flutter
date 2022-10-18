part of 'favorite_store_bloc.dart';


abstract class FavoriteStoreEvent extends Equatable{
  const FavoriteStoreEvent();
}

class FavoriteStoreRequested extends Equatable{
  const FavoriteStoreRequested();

  @override
  List<Object?> get props => [];
}

class FavoriteStoreClicked extends Equatable{
  final int clickedStoreId;
  const FavoriteStoreClicked({required this.clickedStoreId});

  @override
  List<Object?> get props => [];

}