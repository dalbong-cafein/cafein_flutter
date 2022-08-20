import 'dart:async';

import 'package:cafein_flutter/data/model/sticker/sticker.dart';
import 'package:cafein_flutter/data/repository/coupon_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sticker_event.dart';

part 'sticker_state.dart';

class StickerBloc extends Bloc<StickerEvent, StickerState> {
  StickerBloc({required this.stickerRepository, required this.couponRepository})
      : super(const StickerInitial()) {
    on<StickerRequested>(_onStickerRequested);
    on<StickerReverseRequested>(_onStickerReverseRequested);
  }

  final StickerRepository stickerRepository;
  final CouponRepository couponRepository;

  FutureOr<void> _onStickerRequested(
    StickerRequested event,
    Emitter<StickerState> emit,
  ) async {
    emit(StickerLoading());
    try {
      final stickerCntResponse = await stickerRepository.getStickerCount();
      final stickersResponse = await stickerRepository.getStickers();
      final stickerCnt = stickerCntResponse.data;
      final stickers = stickersResponse.data;
      final couponResponse = await couponRepository.getCoupons();
      final int couponCnt = couponResponse.data.length;
      emit(StickerLoaded(stickerCnt: stickerCnt, stickers: [...stickers], couponCnt: couponCnt));
    } catch (e) {
      emit(StickerError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onStickerReverseRequested(
    StickerReverseRequested event,
    Emitter<StickerState> emit,
  ) async {
    emit(StickerLoading());
    try {
      final reversedStickers = List.from(event.stickers.reversed);
      emit(StickerLoaded(
          stickerCnt: event.stickerCnt,
          stickers: [...reversedStickers],
          couponCnt: event.couponCnt));
    } catch (e) {
      emit(StickerError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
