part of 'congestion_bloc.dart';

abstract class CongestionEvent extends Equatable {
  const CongestionEvent();

  @override
  List<Object?> get props => [];
}

class CongestionRequested extends CongestionEvent {
  const CongestionRequested({
    required this.day,
  });

  final String day;

  @override
  List<Object?> get props => [day];
}

class CongestionCreateRequested extends CongestionEvent {
  const CongestionCreateRequested({
    required this.score,
  });

  final int score;

  @override
  List<Object?> get props => [score];
}
