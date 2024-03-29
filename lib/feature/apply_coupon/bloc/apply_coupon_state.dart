part of 'apply_coupon_bloc.dart';

abstract class ApplyCouponState extends Equatable {
  const ApplyCouponState();
}

class ApplyCouponInitial extends ApplyCouponState {
  const ApplyCouponInitial();

  @override
  List<Object?> get props => [];
}

class CouponClickLoaded extends ApplyCouponState {
  const CouponClickLoaded({required this.clickedIndex});

  final int clickedIndex;

  @override
  List<Object?> get props => [];
}

class CouponLoading extends ApplyCouponState {
  const CouponLoading();

  @override
  List<Object?> get props => [];
}

class CouponReClickLoaded extends ApplyCouponState {
  const CouponReClickLoaded();

  @override
  List<Object?> get props => [];
}

class ApplyCouponLoading extends ApplyCouponState {
  const ApplyCouponLoading();

  @override
  List<Object?> get props => [];
}

class ApplyCouponLoaded extends ApplyCouponState {
  const ApplyCouponLoaded();

  @override
  List<Object?> get props => [];
}

class ApplyCouponError extends ApplyCouponState {
  const ApplyCouponError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
