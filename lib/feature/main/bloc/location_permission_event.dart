part of 'location_permission_bloc.dart';

abstract class LocationPermissionEvent extends Equatable {
  const LocationPermissionEvent();

  @override
  List<Object?> get props => [];
}

class LocationPermissionRequest extends LocationPermissionEvent {
  const LocationPermissionRequest({
    required this.processType,
  });

  final ProcessType processType;

  @override
  List<Object?> get props => [processType];
}
