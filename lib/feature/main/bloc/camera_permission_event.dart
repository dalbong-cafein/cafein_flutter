part of 'camera_permission_bloc.dart';

abstract class CameraPermissionEvent extends Equatable {
  const CameraPermissionEvent();

  @override
  List<Object?> get props => [];
}

class CameraPermissionRequested extends CameraPermissionEvent {
  const CameraPermissionRequested({
    required this.processType,
  });

  final CameraProcessType processType;

  @override
  List<Object?> get props => [processType];
}
