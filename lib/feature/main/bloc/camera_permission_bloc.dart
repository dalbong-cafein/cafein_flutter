import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'camera_permission_event.dart';
part 'camera_permission_state.dart';

enum CameraProcessType {
  gallery,
  createProfile,
  editProfile,
}

class CameraPermissionBloc
    extends Bloc<CameraPermissionEvent, CameraPermissionState> {
  CameraPermissionBloc() : super(const CameraPermissionInitial()) {
    on<CameraPermissionRequested>(_onCameraPermissionRequested);
  }

  FutureOr<void> _onCameraPermissionRequested(
    CameraPermissionRequested event,
    Emitter<CameraPermissionState> emit,
  ) async {
    emit(const CameraPermissionLoading());

    final status = await Permission.camera.request();

    emit(CameraPermissionChecked(
      permissionStatus: status,
      processType: event.processType,
    ));
  }
}
