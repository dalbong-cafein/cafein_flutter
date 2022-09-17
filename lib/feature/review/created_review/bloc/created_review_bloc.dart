import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'created_review_event.dart';

part 'created_review_state.dart';

class CreatedReviewBloc extends Bloc<CreatedReviewEvent, CreatedReviewState> {
  CreatedReviewBloc() : super(CreatedReviewInitial()) {
    on<CreatedReviewPermissionRequested>(_onCreatedReviewPermissionRequested);
  }

  FutureOr<void> _onCreatedReviewPermissionRequested(
    CreatedReviewPermissionRequested event,
    Emitter<CreatedReviewState> emit,
  ) async {
    final status = await event.permission.request();
    emit(
      CreatedReviewPermissionChecked(
        permission: event.permission,
        permissionStatus: status,
      ),
    );
  }
}
