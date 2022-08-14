import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_view_event.dart';
part 'more_view_state.dart';

class MoreViewBloc extends Bloc<MoreViewEvent, MoreViewState> {
  MoreViewBloc({
    required this.authRepository,
  }) : super(const MoreViewInitial()) {
    on<MoreViewSignOutRequested>(_onMoreViewSignOutRequested);
  }

  final AuthRepository authRepository;

  FutureOr<void> _onMoreViewSignOutRequested(
    MoreViewSignOutRequested event,
    Emitter<MoreViewState> emit,
  ) async {
    emit(const MoreViewLoading());

    try {
      await authRepository.signOut();
      emit(const MoreViewSignOuted());
    } catch (e) {
      emit(
        MoreViewError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
