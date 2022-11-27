part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationRequested extends NotificationEvent {
  const NotificationRequested({
    required this.isPreview,
  });

  final bool isPreview;
}

class NotificationReadRequested extends NotificationEvent {
  final int notificationIndex;

  const NotificationReadRequested({
    required this.notificationIndex,
  });

  @override
  List<Object?> get props => [notificationIndex];
}

class NotificationDeleteRequested extends NotificationEvent {
  const NotificationDeleteRequested();
}
