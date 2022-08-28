part of 'more_view_bloc.dart';

abstract class MoreViewState extends Equatable {
  const MoreViewState();

  @override
  List<Object?> get props => [];
}

class MoreViewInitial extends MoreViewState {
  const MoreViewInitial();
}

class MoreViewLoading extends MoreViewState {
  const MoreViewLoading();
}

class MoreViewStoreCntAndReviewCntLoaded extends MoreViewState {
  const MoreViewStoreCntAndReviewCntLoaded({
    required this.storeCount,
    required this.reviewCount,
  });

  final int storeCount;
  final int reviewCount;

  @override
  List<Object?> get props => [
        storeCount,
        reviewCount,
      ];
}

class MoreViewError extends MoreViewState {
  const MoreViewError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class MoreViewSignOuted extends MoreViewState {
  const MoreViewSignOuted();
}

class MoreViewProfileEdited extends MoreViewState {
  const MoreViewProfileEdited();

  @override
  List<Object?> get props => [
        DateTime.now(),
      ];
}
