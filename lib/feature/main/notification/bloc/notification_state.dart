part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationInitial extends NotificationState {
  const NotificationInitial();

  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {
  const NotificationLoading();

  @override
  List<Object?> get props => [];
}

class NotificationLoaded extends NotificationState {
  final List<Notification> notifications;

  const NotificationLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationError extends NotificationState {
  const NotificationError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
