part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  const TimerStarted({
    required this.startDuration,
  });

  final int startDuration;

  @override
  List<Object?> get props => [startDuration];
}

class TimerTicked extends TimerEvent {
  const TimerTicked({
    required this.duration,
  });

  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerCanceled extends TimerEvent {
  const TimerCanceled();

  @override
  List<Object?> get props => [];
}
