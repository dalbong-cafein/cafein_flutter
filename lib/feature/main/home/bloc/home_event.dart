part of 'home_bloc.dart';


abstract class HomeEvent extends Equatable{
  const HomeEvent();
}


class HomeRequested extends HomeEvent{
  @override
  List<Object?> get props => [];
}

class HomeRecommendStoreRequested extends HomeEvent{
  @override
  List<Object?> get props => [];
}
