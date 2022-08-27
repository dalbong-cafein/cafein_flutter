import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'apply_coupon_event.dart';
part 'apply_coupon_state.dart';

class ApplyCouponBloc extends Bloc<ApplyCouponEvent, ApplyCouponState> {
  ApplyCouponBloc() : super(const ApplyCouponInitial()) {
    on<CouponClicked>(_onCouponClicked);
  }

  FutureOr<void> _onCouponClicked(
      CouponClicked event,
      Emitter<ApplyCouponState> emit) async {
    emit(CouponClickLoaded(clickedIndex: event.clickedIndex));
  }
}
