import 'dart:async';

import 'package:cafein_flutter/data/model/store/registered_store.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registered_store_event.dart';
part 'registered_store_state.dart';

class RegisteredStoreBloc extends Bloc<RegisteredStoreEvent, RegisteredStoreState> {
  RegisteredStoreBloc({
    required this.storeRepository,
  }) : super(const RegisteredStoreInitial()) {
    on<RegisteredStoreRequested>(_onRegisteredStoreRequested);
  }

  final StoreRepository storeRepository;

  FutureOr<void> _onRegisteredStoreRequested(
    RegisteredStoreRequested event,
    Emitter<RegisteredStoreState> emit,
  ) async {
    emit(const RegisteredStoreLoading());

    try {
      final response = await storeRepository.getMyRegisteredStores();

      if (response.code == -1) {
        emit(
          RegisteredStoreError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }

      emit(
        RegisteredStoreLoaded(
          storeList: response.data.storeData,
          storeCount: response.data.storeCnt,
        ),
      );
    } catch (e) {
      emit(
        RegisteredStoreError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}
