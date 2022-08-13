import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/sticker/sticker.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sticker_event.dart';
part 'sticker_state.dart';

class StickerBloc extends Bloc<StickerEvent, StickerState> {
  StickerBloc() : super(StickerInitial()) {
    on<StickerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
