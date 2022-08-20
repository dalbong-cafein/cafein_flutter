import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainNavigationSelected(index: 3)) {
    on<MainTabChanged>(_onMainTabChanged);
  }

  FutureOr<void> _onMainTabChanged(
    MainTabChanged event,
    Emitter<MainState> emit,
  ) {
    emit(MainNavigationSelected(index: event.index));
  }
}
