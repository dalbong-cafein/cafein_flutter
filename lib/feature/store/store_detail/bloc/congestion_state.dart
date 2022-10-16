part of 'congestion_bloc.dart';

abstract class CongestionState extends Equatable {
  const CongestionState();

  @override
  List<Object?> get props => [];
}

class CongestionInitial extends CongestionState {
  const CongestionInitial();
}

class CongestionLoading extends CongestionState {
  const CongestionLoading();
}

class CongestionLoaded extends CongestionState {
  const CongestionLoaded({
    required this.congestionResponse,
    required this.day,
  });

  final CongestionResponse congestionResponse;
  final String day;

  @override
  List<Object?> get props => [
        congestionResponse,
        day,
      ];
}

class CongestionLocationChecked extends CongestionState {
  const CongestionLocationChecked({
    required this.isAvailable,
  });

  final bool isAvailable;

  @override
  List<Object?> get props => [isAvailable];
}

class CongestionStickerCountChecked extends CongestionState {
  const CongestionStickerCountChecked({
    required this.isAvailable,
  });

  final bool isAvailable;

  @override
  List<Object?> get props => [isAvailable];
}

class CongestionStickerError extends CongestionState {
  const CongestionStickerError();
}

class CongestionCreatedSucceed extends CongestionState {
  const CongestionCreatedSucceed();
}

class CongestionStickerCreatedSucceed extends CongestionState {
  const CongestionStickerCreatedSucceed();
}

class CongestionPossibleChecked extends CongestionState {
  const CongestionPossibleChecked({
    required this.isPossible,
  });

  final bool isPossible;

  @override
  List<Object?> get props => [isPossible];
}

class CongestionError extends CongestionState {
  const CongestionError({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [
        error,
      ];
}
