part of 'received_coupons_bloc.dart';

abstract class ReceivedCouponsState extends Equatable {
  const ReceivedCouponsState();
}

class ReceivedCouponsInitial extends ReceivedCouponsState {
  const ReceivedCouponsInitial();

  @override
  List<Object?> get props => [];
}

class ReceivedCouponsLoading extends ReceivedCouponsState {
  const ReceivedCouponsLoading();

  @override
  List<Object?> get props => [];
}

class ReceivedCouponsLoaded extends ReceivedCouponsState {
  const ReceivedCouponsLoaded({required this.coupons});

  final List<Coupon> coupons;

  @override
  List<Object?> get props => [
        [...coupons]
      ];
}

class ReceivedCouponsError extends ReceivedCouponsState {
  const  ReceivedCouponsError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
