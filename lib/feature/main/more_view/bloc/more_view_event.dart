part of 'more_view_bloc.dart';

abstract class MoreViewEvent extends Equatable {
  const MoreViewEvent();

  @override
  List<Object?> get props => [];
}

class MoreViewSignOutRequested extends MoreViewEvent {
  const MoreViewSignOutRequested();
}

class MoreViewCountRequested extends MoreViewEvent {
  const MoreViewCountRequested();
}
