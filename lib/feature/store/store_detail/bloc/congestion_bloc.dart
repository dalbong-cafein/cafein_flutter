import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_request.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';
import 'package:cafein_flutter/data/repository/congestion_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'congestion_event.dart';
part 'congestion_state.dart';

class CongestionBloc extends Bloc<CongestionEvent, CongestionState> {
  CongestionBloc({
    required this.congestionRepository,
    required this.storeId,
  }) : super(const CongestionInitial()) {
    on<CongestionRequested>(_onCongestionRequested);
    on<CongestionCreateRequested>(_onCongestionCreateRequested);
  }

  final CongestionRepository congestionRepository;
  final int storeId;

  final today = '${DateFormat.E('ko_KR').format(
    DateTime.now(),
  )}요일';

  FutureOr<void> _onCongestionRequested(
    CongestionRequested event,
    Emitter<CongestionState> emit,
  ) async {
    emit(const CongestionLoading());

    try {
      final requestDayIndex = CafeinConst.krDays.indexOf(event.day);
      final currentDayIndex = CafeinConst.krDays.indexOf(today);

      int minusDay = currentDayIndex - requestDayIndex;
      if (minusDay < 0) {
        minusDay += 7;
      }

      final response = await congestionRepository.getCongestions(
        storeId: storeId,
        minusDays: minusDay,
      );

      emit(
        CongestionLoaded(
          congestionResponse: response.data,
          day: event.day,
        ),
      );
    } catch (e) {
      emit(
        CongestionError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onCongestionCreateRequested(
    CongestionCreateRequested event,
    Emitter<CongestionState> emit,
  ) async {
    emit(const CongestionLoading());

    try {
      final response = await congestionRepository.createCongestion(
        CongestionRequest(
          storeId: storeId,
          congestionScore: event.score,
        ),
      );

      if (response.code == -1) {
        emit(
          CongestionError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(const CongestionCreatedSucceed());
    } catch (e) {
      emit(
        CongestionError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
