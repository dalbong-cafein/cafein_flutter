part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState();
}

class TimerInitial extends TimerState {
  const TimerInitial();

  @override
  List<Object> get props => [];
}

class TimerRun extends TimerState {
  const TimerRun({
    required this.duration,
  });

  final int duration;

  @override
  List<Object?> get props => [duration];
}

class TimerEnded extends TimerState {
  const TimerEnded();

  @override
  List<Object?> get props => [];
}
