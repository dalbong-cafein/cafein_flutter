import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_request.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';
import 'package:cafein_flutter/data/model/sticker/congestion_sticker_request.dart';
import 'package:cafein_flutter/data/repository/congestion_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/util/calculate_distance.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

part 'congestion_event.dart';
part 'congestion_state.dart';

class CongestionBloc extends Bloc<CongestionEvent, CongestionState> {
  CongestionBloc({
    required this.congestionRepository,
    required this.stickerRepository,
    required this.storeId,
  }) : super(const CongestionInitial()) {
    on<CongestionRequested>(_onCongestionRequested);
    on<CongestionCreateRequested>(_onCongestionCreateRequested);
    on<CongestionLocationRequested>(_onCongestionLocationRequested);
    on<CongestionStickerRequested>(_onCongestionStickerRequested);
    on<CongestionPossibleRequested>(_onCongestionPossibleRequested);
    on<CongestionStickerPossibleRequested>(
        _onCongestionStickerPossibleRequested);
  }

  final CongestionRepository congestionRepository;
  final StickerRepository stickerRepository;
  final int storeId;

  int congestionId = -1;
  bool isInitialLoaded = true;

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
          isInitialLoaded: isInitialLoaded,
          congestionResponse: response.data,
          day: event.day,
        ),
      );
      if (isInitialLoaded) {
        isInitialLoaded = false;
      }
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

      congestionId = response.data;

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

  FutureOr<void> _onCongestionLocationRequested(
    CongestionLocationRequested event,
    Emitter<CongestionState> emit,
  ) async {
    emit(const CongestionLoading());
    try {
      final result = await Geolocator.getCurrentPosition();

      final distance = calculateDistance(
        currentLatLng: LatLng(result.latitude, result.longitude),
        targetLatLng: LatLng(event.latY, event.lngX),
      );

      emit(
        CongestionLocationChecked(
          isAvailable: distance <= 100,
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

  FutureOr<void> _onCongestionStickerRequested(
    CongestionStickerRequested event,
    Emitter<CongestionState> emit,
  ) async {
    emit(const CongestionLoading());
    try {
      final response = await stickerRepository.createCongestionSticker(
        CongestionStickerRequest(
          congestionId: congestionId,
        ),
      );

      if (response.code == -1) {
        emit(const CongestionStickerError());
        return;
      }

      emit(const CongestionStickerCreatedSucceed());
    } catch (e) {
      emit(const CongestionStickerError());
    }
  }

  FutureOr<void> _onCongestionPossibleRequested(
    CongestionPossibleRequested event,
    Emitter<CongestionState> emit,
  ) async {
    emit(const CongestionLoading());
    try {
      final response = await congestionRepository.isPossible(storeId);

      emit(CongestionPossibleChecked(
        isPossible: response.data.isPossibleRegistration,
        reason: response.data.reason,
      ));
    } catch (e) {
      emit(
        CongestionError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onCongestionStickerPossibleRequested(
    CongestionStickerPossibleRequested event,
    Emitter<CongestionState> emit,
  ) async {
    emit(const CongestionLoading());
    try {
      final response = await stickerRepository.isPossibleSticker();

      emit(CongestionStickerPossibleChecked(
        isPossible: response.data.isPossibleIssue,
        reason: response.data.reason,
      ));
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
