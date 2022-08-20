import 'dart:async';

import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/data/model/enum/board_category.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc({
    required this.boardRepository,
  }) : super(const FaqInitial()) {
    on<FaqRequested>(_onFaqRequested);
  }

  final BoardRepository boardRepository;

  FutureOr<void> _onFaqRequested(
    FaqRequested event,
    Emitter<FaqState> emit,
  ) async {
    emit(const FaqLoading());
    try {
      final response = await boardRepository.getBoards(
        BoardCategory.faq.boardCategoryId,
      );
      if (response.code == -1) {
        emit(
          FaqError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(FaqLoaded(faqs: response.data));
    } catch (e) {
      emit(
        FaqError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
