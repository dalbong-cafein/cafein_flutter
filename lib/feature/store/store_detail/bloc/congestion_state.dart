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
