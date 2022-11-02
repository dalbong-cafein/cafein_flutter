import 'dart:async';

import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notice_detail_event.dart';
part 'notice_detail_state.dart';

class NoticeDetailBloc extends Bloc<NoticeDetailEvent, NoticeDetailState> {
  NoticeDetailBloc({
    required this.boardRepository,
    required this.noticeId,
  }) : super(const NoticeDetailInitial()) {
    on<NoticeDetailRequested>(_onNoticeDetailRequested);

    add(const NoticeDetailRequested());
  }

  final BoardRepository boardRepository;
  final int noticeId;

  FutureOr<void> _onNoticeDetailRequested(
    NoticeDetailRequested event,
    Emitter<NoticeDetailState> emit,
  ) async {
    emit(const NoticeDetailLoading());
    try {
      final response = await boardRepository.getBoard(noticeId);

      if (response.code == -1) {
        emit(
          NoticeDetailError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(
        NoticeDetailLoaded(
          notice: response.data,
        ),
      );
    } catch (e) {
      emit(
        NoticeDetailError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
