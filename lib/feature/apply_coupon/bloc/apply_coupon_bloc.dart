import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'apply_coupon_event.dart';
part 'apply_coupon_state.dart';

class ApplyCouponBloc extends Bloc<ApplyCouponEvent, ApplyCouponState> {
  ApplyCouponBloc() : super(ApplyCouponInitial()) {
    on<ApplyCouponEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
