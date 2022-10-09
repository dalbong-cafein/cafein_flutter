import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'photo_permission_event.dart';
part 'photo_permission_state.dart';

enum PhotoProcessType {
  createReview,
  updateReview,
  createProfile,
  updateProfile,
}

class PhotoPermissionBloc
    extends Bloc<PhotoPermissionEvent, PhotoPermissionState> {
  PhotoPermissionBloc() : super(const PhotoPermissionInitial()) {
    on<PhotoPermissionRequested>(_onPhotoPermissionRequested);
  }

  FutureOr<void> _onPhotoPermissionRequested(
    PhotoPermissionRequested event,
    Emitter<PhotoPermissionState> emit,
  ) async {
    emit(const PhotoPermissionLoading());

    final status = await Permission.photos.request();

    emit(PhotoPermissionChecked(
      permissionStatus: status,
      processType: event.processType,
    ));
  }
}
