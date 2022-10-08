part of 'photo_permission_bloc.dart';

abstract class PhotoPermissionState extends Equatable {
  const PhotoPermissionState();

  @override
  List<Object?> get props => [];
}

class PhotoPermissionInitial extends PhotoPermissionState {
  const PhotoPermissionInitial();
}

class PhotoPermissionLoading extends PhotoPermissionState {
  const PhotoPermissionLoading();
}

class PhotoPermissionChecked extends PhotoPermissionState {
  const PhotoPermissionChecked({
    required this.permissionStatus,
  });

  final PermissionStatus permissionStatus;

  @override
  List<Object?> get props => [
        permissionStatus,
      ];
}
