import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/coupon/coupon_request.dart';
import 'package:cafein_flutter/data/repository/coupon_repository.dart';
import 'package:equatable/equatable.dart';

part 'apply_coupon_event.dart';

part 'apply_coupon_state.dart';

class ApplyCouponBloc extends Bloc<ApplyCouponEvent, ApplyCouponState> {
  ApplyCouponBloc({required this.couponRepository}) : super(const ApplyCouponInitial()) {
    on<CouponClicked>(_onCouponClicked);
    on<CouponInitialLoading>(_onCouponInitialLoaded);
    on<CouponReClicked>(_onCouponReClicked);
    on<ApplyCouponRequested>(_onApplyCouponRequested);
  }

  final CouponRepository couponRepository;

  FutureOr<void> _onCouponClicked(
      CouponClicked event, Emitter<ApplyCouponState> emit) async {
    emit(const CouponLoading());
    emit(CouponClickLoaded(clickedIndex: event.clickedIndex));
  }

  FutureOr<void> _onCouponInitialLoaded(
      CouponInitialLoading event, Emitter<ApplyCouponState> emit) async {
    emit(const CouponLoading());
  }

  FutureOr<void> _onCouponReClicked(
      CouponReClicked event, Emitter<ApplyCouponState> emit) async {
    emit(const CouponReClickLoaded());
  }

  FutureOr<void> _onApplyCouponRequested(
      ApplyCouponRequested event, Emitter<ApplyCouponState> emit) async {
    emit(const ApplyCouponLoading());
    try {
      CouponRequest couponRequest = CouponRequest(
          brandName: CafeinConst.couponStoreNames[event.clickedIndex],
          itemName: CafeinConst.couponItemNames[event.clickedIndex]);
      couponRepository.createCoupon(couponRequest);
      emit(const ApplyCouponLoaded());
    } catch (e) {
      emit(ApplyCouponError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
