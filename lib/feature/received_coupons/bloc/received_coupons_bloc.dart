import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'received_coupons_event.dart';
part 'received_coupons_state.dart';

class ReceivedCouponsBloc extends Bloc<ReceivedCouponsEvent, ReceivedCouponsState> {
  ReceivedCouponsBloc() : super(ReceivedCouponsInitial()) {
    on<ReceivedCouponsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
