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
    on<CreatedReviewRequested>(_onCreatedReviewRequested);
    on<CreatedReviewPhotoRequested>(_onCreatedReviewPhotoRequested);
    on<CreatedReviewPhotoDeleteRequested>(_onCreatedReviewPhotoDeleteRequested);
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

  FutureOr<void> _onCreatedReviewRequested(
    CreatedReviewRequested event,
    Emitter<CreatedReviewState> emit,
  ) {
    //  final cachePath = await getApplicationDocumentsDirectory();

    //       final decodeImageFile = img.decodeImage(File(result).readAsBytesSync())!;
    //       final thumbnail = img.copyResize(
    //         decodeImageFile,
    //         width: 1048,
    //       );
    //       File('${cachePath.path}/thumbnail.jpg').writeAsBytesSync(img.encodeJpg(thumbnail));

    //       log('변환 전: ${File(result).lengthSync() / (1024 * 1024)}');
    //       log('변환 후: ${File('${cachePath.path}/thumbnail.jpg').lengthSync() / (1024 * 1024)}');
  }

  FutureOr<void> _onCreatedReviewPhotoRequested(
    CreatedReviewPhotoRequested event,
    Emitter<CreatedReviewState> emit,
  ) {
    photos = [...event.photoList];

    emit(
      CreatedReviewPhotoSelected(
        photos: [...photos],
      ),
    );
  }

  FutureOr<void> _onCreatedReviewPhotoDeleteRequested(
    CreatedReviewPhotoDeleteRequested event,
    Emitter<CreatedReviewState> emit,
  ) {
    photos.remove(event.photo);

    emit(
      CreatedReviewPhotoSelected(
        photos: [...photos],
      ),
    );
  }
}
