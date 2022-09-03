import 'dart:async';

import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_detail_event.dart';
part 'store_detail_state.dart';

class StoreDetailBloc extends Bloc<StoreDetailEvent, StoreDetailState> {
  StoreDetailBloc({
    required this.storeRepository,
  }) : super(const StoreDetailInitial()) {
    on<StoreDetailRequested>(_onStoreDetailRequested);
  }

  final StoreRepository storeRepository;

  FutureOr<void> _onStoreDetailRequested(
    StoreDetailRequested event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(const StoreDetailLoading());

    try {
      final response = await storeRepository.getStoreDetail(
        event.storeId,
      );

      if (response.code == -1) {
        emit(
          StoreDetailError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(
        StoreDetailLoaded(
          storeDetail: response.data,
        ),
      );
    } catch (e) {
      emit(
        StoreDetailError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
