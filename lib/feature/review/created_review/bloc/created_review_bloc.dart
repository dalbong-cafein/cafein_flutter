import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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
