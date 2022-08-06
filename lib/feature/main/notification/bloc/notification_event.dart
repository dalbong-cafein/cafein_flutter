part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationRequested extends NotificationEvent {
  const NotificationRequested();

  @override
  List<Object?> get props => [];
}

class NotificationDeleteRequested extends NotificationEvent {
  final int notificationIndex;

  const NotificationDeleteRequested({
    required this.notificationIndex,
  });

  @override
  List<Object?> get props => [notificationIndex];
}

class NotificationReadRequested extends NotificationEvent {
  final int notificationIndex;

  const NotificationReadRequested({
    required this.notificationIndex,
  });

  @override
  List<Object?> get props => [notificationIndex];
}
