import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/sticker/sticker.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:equatable/equatable.dart';

part 'sticker_event.dart';
part 'sticker_state.dart';

class StickerBloc extends Bloc<StickerEvent, StickerState> {
  StickerBloc({required this.stickerRepository}) : super(const StickerInitial()) {
    on<StickerRequested>(_onStickerRequested);
  }
  final StickerRepository stickerRepository;

  FutureOr<void> _onStickerRequested(
      StickerRequested event,
      Emitter<StickerState> emit,
      ) async {
      emit(StickerLoading());
      try{
        final stickerCntResponse = await stickerRepository.getStickerCount();
        final stickersResponse = await stickerRepository.getStickers();
        final stickerCnt = stickerCntResponse.data;
        final stickers = stickersResponse.data;
        emit(StickerLoaded(
            stickerCnt: stickerCnt,
            stickers: stickers
        ));
      }catch(e){
        emit(StickerError(
          error: e,
          event: () => add(event),
        ));
      }
  }
}
