part of 'camera_permission_bloc.dart';

abstract class CameraPermissionState extends Equatable {
  const CameraPermissionState();

  @override
  List<Object?> get props => [];
}

class CameraPermissionInitial extends CameraPermissionState {
  const CameraPermissionInitial();
}

class CameraPermissionLoading extends CameraPermissionState {
  const CameraPermissionLoading();
}

class CameraPermissionChecked extends CameraPermissionState {
  const CameraPermissionChecked({
    required this.permissionStatus,
    required this.processType,
  });

  final PermissionStatus permissionStatus;
  final CameraProcessType processType;

  @override
  List<Object?> get props => [
        permissionStatus,
        processType,
      ];
}
