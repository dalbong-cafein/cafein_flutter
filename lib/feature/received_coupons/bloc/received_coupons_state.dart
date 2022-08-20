part of 'received_coupons_bloc.dart';

abstract class ReceivedCouponsState extends Equatable {
  const ReceivedCouponsState();
}

class ReceivedCouponsInitial extends ReceivedCouponsState {
  const ReceivedCouponsInitial();

  @override
  List<Object?> get props => [];
}
