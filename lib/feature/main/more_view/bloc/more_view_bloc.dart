import 'dart:async';

import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_view_event.dart';
part 'more_view_state.dart';

class MoreViewBloc extends Bloc<MoreViewEvent, MoreViewState> {
  MoreViewBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const MoreViewInitial()) {
    on<MoreViewSignOutRequested>(_onMoreViewSignOutRequested);
    on<MoreViewCountRequested>(_onMoreViewCountRequested);
    on<MoreViewProfileChanged>(_onMoreViewProfileChanged);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;

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

  FutureOr<void> _onMoreViewCountRequested(
    MoreViewCountRequested event,
    Emitter<MoreViewState> emit,
  ) async {
    emit(const MoreViewLoading());

    if (event.isPreview) {
      emit(
        const MoreViewStoreCntAndReviewCntLoaded(
          storeCount: 0,
          reviewCount: 0,
        ),
      );

      return;
    }

    try {
      final response = await userRepository.getStoreCntAndReviewCnt();

      if (response.code == -1) {
        emit(
          MoreViewError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(
        MoreViewStoreCntAndReviewCntLoaded(
          storeCount: response.data.storeCnt,
          reviewCount: response.data.reviewCnt,
        ),
      );
    } catch (e) {
      emit(
        MoreViewError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onMoreViewProfileChanged(
    MoreViewProfileChanged event,
    Emitter<MoreViewState> emit,
  ) {
    emit(const MoreViewProfileEdited());
  }
}
