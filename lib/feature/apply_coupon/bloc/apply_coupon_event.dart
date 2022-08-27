part of 'apply_coupon_bloc.dart';


abstract class ApplyCouponEvent extends Equatable{}

class CouponClicked extends ApplyCouponEvent{
  CouponClicked({required this.clickedIndex});
  final int clickedIndex;
  @override
  List<Object?> get props => [clickedIndex];

}

class CouponInitialLoading extends ApplyCouponEvent{

  @override
  List<Object?> get props => [];

}

class CouponReClicked extends ApplyCouponEvent{
  @override
  List<Object?> get props => [];

}