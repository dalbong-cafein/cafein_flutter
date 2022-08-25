part of 'received_coupons_bloc.dart';


abstract class ReceivedCouponsEvent extends Equatable{

}
class ReceivedCouponsRequested extends ReceivedCouponsEvent{
  @override
  List<Object?> get props => [];

}

class CouponClicked extends ReceivedCouponsEvent{
  CouponClicked({required this.clickedIndex});
  final int clickedIndex;
  @override
  List<Object?> get props => [clickedIndex];

}
