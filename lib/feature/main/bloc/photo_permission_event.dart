part of 'photo_permission_bloc.dart';

abstract class PhotoPermissionEvent extends Equatable {
  const PhotoPermissionEvent();

  @override
  List<Object?> get props => [];
}

class PhotoPermissionRequested extends PhotoPermissionEvent {
  const PhotoPermissionRequested();
}
