part of 'location_permission_bloc.dart';

abstract class LocationPermissionState extends Equatable {
  const LocationPermissionState();

  @override
  List<Object?> get props => [];
}

class LocationPermissionInitial extends LocationPermissionState {
  const LocationPermissionInitial();
}

class LocationPermissionLoading extends LocationPermissionState {
  const LocationPermissionLoading();
}

class LocationPermissionChecked extends LocationPermissionState {
  const LocationPermissionChecked({
    required this.permissionStatus,
  });

  final PermissionStatus permissionStatus;

  @override
  List<Object?> get props => [
        permissionStatus,
      ];
}
