import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'apply_coupon_event.dart';
part 'apply_coupon_state.dart';

class ApplyCouponBloc extends Bloc<ApplyCouponEvent, ApplyCouponState> {
  ApplyCouponBloc() : super(const ApplyCouponInitial()) {
    on<CouponClicked>(_onCouponClicked);
    on<CouponInitialLoading>(_onCouponInitialLoaded);
  }

  FutureOr<void> _onCouponClicked(
      CouponClicked event,
      Emitter<ApplyCouponState> emit) async {
    emit(const CouponLoading());
    emit(CouponClickLoaded(clickedIndex: event.clickedIndex));
  }

  FutureOr<void> _onCouponInitialLoaded(
      CouponInitialLoading event,
      Emitter<ApplyCouponState> emit) async {
    emit(const CouponLoading());
  }
}
