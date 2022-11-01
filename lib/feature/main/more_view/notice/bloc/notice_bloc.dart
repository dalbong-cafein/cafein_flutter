import 'dart:async';

import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/data/model/enum/board_category.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  NoticeBloc({
    required this.boardRepository,
  }) : super(const NoticeInitial()) {
    on<NoticeRequested>(_onNoticeRequested);
  }

  final BoardRepository boardRepository;

  FutureOr<void> _onNoticeRequested(
    NoticeRequested event,
    Emitter<NoticeState> emit,
  ) async {
    emit(const NoticeLoading());
    try {
      final response = await boardRepository.getBoards(
        BoardCategory.notice.boardCategoryId,
      );

      if (response.code == -1) {
        emit(
          NoticeError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(
        NoticeLoaded(boards: response.data),
      );
    } catch (e) {
      emit(
        NoticeError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }


  FutureOr<void> _onNoticeDetailRequested(
      NoticeDetailRequested event,
      Emitter<NoticeState> emit,
      ) async {
    emit(const NoticeLoading());
    try {
      final response = await boardRepository.getBoard(
        event.clickedBoardId
      );

      if (response.code == -1) {
        emit(
          NoticeError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(
        NoticeDetailLoaded(board: response.data)
      );
    } catch (e) {
      emit(
        NoticeError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
