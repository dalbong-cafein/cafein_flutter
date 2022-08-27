part of 'apply_coupon_bloc.dart';

abstract class ApplyCouponState extends Equatable{
  const ApplyCouponState();
}

class ApplyCouponInitial extends ApplyCouponState {
  const ApplyCouponInitial();
  @override
  List<Object?> get props => [];
}

class CouponClickLoaded extends ApplyCouponState{
  const CouponClickLoaded({required this.clickedIndex});
  final int clickedIndex;
  @override
  List<Object?> get props => [];

}