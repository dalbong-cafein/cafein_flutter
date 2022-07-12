part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainTabChanged extends MainEvent {
  final int index;

  const MainTabChanged({
    required this.index,
  });

  @override
  List<Object?> get props => [];
}
