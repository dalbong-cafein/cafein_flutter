part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainNavigationSelected extends MainState {
  final int index;

  const MainNavigationSelected({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}
