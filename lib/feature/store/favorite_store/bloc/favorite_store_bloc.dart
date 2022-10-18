import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'favorite_store_event.dart';
part 'favorite_store_state.dart';

class FavoriteStoreBloc extends Bloc<FavoriteStoreEvent, FavoriteStoreState> {
  FavoriteStoreBloc() : super(FavoriteStoreInitial()) {
    on<FavoriteStoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
