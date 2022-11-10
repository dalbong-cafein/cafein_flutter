import 'dart:async';

import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/review/create_review_request.dart';
import 'package:cafein_flutter/data/model/sticker/review_sticker_request.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

part 'created_review_event.dart';
part 'created_review_state.dart';

class CreatedReviewBloc extends Bloc<CreatedReviewEvent, CreatedReviewState> {
  CreatedReviewBloc({
    required this.storeId,
    required this.reviewRepository,
    required this.stickerRepository,
  }) : super(const CreatedReviewInitial()) {
    on<CreatedReviewScoreChanged>(_onCreatedReviewScoreChanged);
    on<CreatedReviewScoreDetailChanged>(_onCreatedReviewScoreDetailChanged);
    on<CreatedReviewTextChanged>(_onCreatedReviewTextChanged);
    on<CreatedReviewRequested>(_onCreatedReviewRequested);
    on<CreatedReviewPhotoRequested>(_onCreatedReviewPhotoRequested);
    on<CreatedReviewPhotoDeleteRequested>(_onCreatedReviewPhotoDeleteRequested);
    on<CreatedReviewStickerCountRequested>(
        _onCreatedReviewStickerCountRequested);
    on<CreatedReviewStickerRequested>(_onCreatedReviewStickerRequested);
  }

  final int storeId;
  final ReviewRepository reviewRepository;
  final StickerRepository stickerRepository;

  List<String> photos = [];

  String wifiScore = '';
  String restroomScore = '';
  String socketScore = '';
  String tableScore = '';
  String reviewText = '';

  ReviewRecommendation? recommendation;

  int createdReviewId = -1;

  FutureOr<void> _onCreatedReviewScoreChanged(
    CreatedReviewScoreChanged event,
    Emitter<CreatedReviewState> emit,
  ) {
    recommendation = event.recommendation;
    emit(
      CreatedReviewScoreChecked(
        recommendation: recommendation,
        wifiScore: wifiScore,
        restroomScore: restroomScore,
        socketScore: socketScore,
        tableScore: tableScore,
        isValid: wifiScore.isNotEmpty &&
            restroomScore.isNotEmpty &&
            socketScore.isNotEmpty &&
            tableScore.isNotEmpty,
      ),
    );
  }

  FutureOr<void> _onCreatedReviewScoreDetailChanged(
    CreatedReviewScoreDetailChanged event,
    Emitter<CreatedReviewState> emit,
  ) {
    switch (event.reviewCategory) {
      case ReviewCategory.socket:
        socketScore = event.score;
        break;
      case ReviewCategory.restroom:
        restroomScore = event.score;
        break;
      case ReviewCategory.table:
        tableScore = event.score;
        break;
      case ReviewCategory.wifi:
        wifiScore = event.score;
        break;
    }

    emit(
      CreatedReviewScoreChecked(
        recommendation: recommendation,
        wifiScore: wifiScore,
        restroomScore: restroomScore,
        socketScore: socketScore,
        tableScore: tableScore,
        isValid: wifiScore.isNotEmpty &&
            restroomScore.isNotEmpty &&
            socketScore.isNotEmpty &&
            tableScore.isNotEmpty,
      ),
    );
  }

  FutureOr<void> _onCreatedReviewRequested(
    CreatedReviewRequested event,
    Emitter<CreatedReviewState> emit,
  ) async {
    emit(const CreatedReviewLoading());
    try {
      final dir = await getApplicationDocumentsDirectory();
      final imagePathList = <String>[];
      for (int i = 0; i < photos.length; i++) {
        final fileName = photos[i].split('/').last.split('.').first;
        final filePath = '${dir.path}/$fileName.jpg';
        await FlutterImageCompress.compressAndGetFile(
          photos[i],
          filePath,
          quality: 80,
        );

        imagePathList.add(filePath);
      }
      final response = await reviewRepository.createReview(
        CreateReivewRequest(
          storeId: storeId,
          content: reviewText,
          recommendation: recommendation!.jsonValue,
          restroom: restroomScore,
          socket: socketScore,
          tableSize: tableScore,
          wifi: wifiScore,
          imageFiles: imagePathList,
        ),
      );

      if (response.code == -1) {
        emit(
          CreatedReviewError(
            event: () => add(event),
            error: Error(),
          ),
        );
      }

      createdReviewId = response.data;
      emit(CreatedReviewSucceed(
        isAvailable: event.isAvailable,
      ));
    } catch (e) {
      emit(
        CreatedReviewError(
          event: () => add(event),
          error: e,
        ),
      );
    }
  }

  FutureOr<void> _onCreatedReviewPhotoRequested(
    CreatedReviewPhotoRequested event,
    Emitter<CreatedReviewState> emit,
  ) {
    photos = [...photos, ...event.photoList];

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

  FutureOr<void> _onCreatedReviewTextChanged(
    CreatedReviewTextChanged event,
    Emitter<CreatedReviewState> emit,
  ) {
    reviewText = event.text;
  }

  FutureOr<void> _onCreatedReviewStickerCountRequested(
    CreatedReviewStickerCountRequested event,
    Emitter<CreatedReviewState> emit,
  ) async {
    emit(const CreatedReviewLoading());

    try {
      final response = await stickerRepository.getStickerCount();

      emit(
        CreatedReviewStickerCountLoaded(
          isAvailable: response.data <= 20,
        ),
      );
    } catch (e) {
      emit(
        CreatedReviewError(
          event: () => add(event),
          error: e,
        ),
      );
    }
  }

  FutureOr<void> _onCreatedReviewStickerRequested(
    CreatedReviewStickerRequested event,
    Emitter<CreatedReviewState> emit,
  ) async {
    emit(const CreatedReviewLoading());
    try {
      final response = await stickerRepository.createReviewSticker(
        ReviewStickerRequest(reviewId: createdReviewId),
      );

      if (response.code == -1) {
        emit(
          const CreatedReviewStickerError(),
        );

        return;
      }

      emit(const CreatedReviewStickerLoaded());
    } catch (e) {
      emit(
        const CreatedReviewStickerError(),
      );
    }
  }
}
