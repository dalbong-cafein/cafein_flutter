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
  const MoreViewCountRequested({
    required this.isPreview,
  });

  final bool isPreview;

  @override
  List<Object?> get props => [isPreview];
}

class MoreViewProfileChanged extends MoreViewEvent {
  const MoreViewProfileChanged();
}
