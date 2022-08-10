import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_permission_event.dart';
part 'location_permission_state.dart';

class LocationPermissionBloc extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  LocationPermissionBloc() : super(const LocationPermissionInitial()) {
    on<LocationPermissionRequest>(_onLocationPermissionRequest);
  }

  FutureOr<void> _onLocationPermissionRequest(
    LocationPermissionRequest event,
    Emitter<LocationPermissionState> emit,
  ) async {
    final status = await Permission.locationWhenInUse.request();
    emit(LocationPermissionChecked(permissionStatus: status));
  }
}
