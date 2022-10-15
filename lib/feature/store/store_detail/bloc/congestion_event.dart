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
  const CongestionCreateRequested(
      {required this.score, required this.isAvailable});

  final int score;
  final bool isAvailable;

  @override
  List<Object?> get props => [score, isAvailable];
}

class CongestionLocationRequested extends CongestionEvent {
  const CongestionLocationRequested({
    required this.latY,
    required this.lngX,
  });

  final double latY;
  final double lngX;

  @override
  List<Object?> get props => [
        latY,
        lngX,
      ];
}

class CongestionStickerCountRequested extends CongestionEvent {
  const CongestionStickerCountRequested();
}

class CongestionStickerRequested extends CongestionEvent {
  const CongestionStickerRequested();
}

class CongestionPossibleRequested extends CongestionEvent {
  const CongestionPossibleRequested();
}
