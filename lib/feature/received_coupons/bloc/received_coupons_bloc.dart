import 'dart:async';

import 'package:cafein_flutter/data/model/coupon/coupon.dart';
import 'package:cafein_flutter/data/repository/coupon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'received_coupons_event.dart';

part 'received_coupons_state.dart';

class ReceivedCouponsBloc extends Bloc<ReceivedCouponsEvent, ReceivedCouponsState> {
  ReceivedCouponsBloc({required this.couponRepository})
      : super(
          const ReceivedCouponsInitial(),
        ) {
    on<ReceivedCouponsRequested>(_onReceivedCouponsRequested);
  }

  final CouponRepository couponRepository;

  FutureOr<void> _onReceivedCouponsRequested(
      ReceivedCouponsRequested event, Emitter<ReceivedCouponsState> emit) async {
    emit(const ReceivedCouponsLoading());
    try {
      final couponResponse = await couponRepository.getCoupons();

      List coupons = couponResponse.data;
      List reversedCoupons = List.from(coupons.reversed);

      emit(ReceivedCouponsLoaded(coupons: [...reversedCoupons]));
    } catch (e) {
      emit(ReceivedCouponsError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
