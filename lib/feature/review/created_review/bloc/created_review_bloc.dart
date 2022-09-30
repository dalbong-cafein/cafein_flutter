import 'dart:async';

import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'created_review_event.dart';
part 'created_review_state.dart';

class CreatedReviewBloc extends Bloc<CreatedReviewEvent, CreatedReviewState> {
  CreatedReviewBloc({
    required this.storeId,
  }) : super(const CreatedReviewInitial()) {
    on<CreatedReviewPermissionRequested>(_onCreatedReviewPermissionRequested);
    on<CreatedReviewScoreChanged>(_onCreatedReviewScoreChanged);
  }

  final int storeId;
  List<String> photos = [];

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

  FutureOr<void> _onCreatedReviewScoreChanged(
    CreatedReviewScoreChanged event,
    Emitter<CreatedReviewState> emit,
  ) {
    emit(
      CreatedReviewScoreChecked(
        recommendation: event.recommendation,
      ),
    );
  }
}
