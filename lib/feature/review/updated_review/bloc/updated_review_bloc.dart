import 'dart:async';

import 'package:cafein_flutter/data/model/common/image_type_pair.dart';
import 'package:cafein_flutter/data/model/enum/image_type.dart';
import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/review/update_review_request.dart';
import 'package:cafein_flutter/data/model/review/user_review.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'updated_review_event.dart';
part 'updated_review_state.dart';

class UpdatedReviewBloc extends Bloc<UpdatedReviewEvent, UpdatedReviewState> {
  UpdatedReviewBloc({
    required this.review,
    required this.reviewRepository,
  }) : super(
          UpdatedReviewState(
            wifiScore: review.detailEvaluation.wifi.toString(),
            restroomScore: review.detailEvaluation.restroom.toString(),
            socketScore: review.detailEvaluation.socket.toString(),
            tableScore: review.detailEvaluation.tableSize.toString(),
            reviewText: review.content ?? '',
            imageUrls: (review.reviewImageIdPairs ?? [])
                .map(
                  (e) => ImageTypePair(
                    imageUrl: e.imageUrl,
                    imageType: ImageType.network,
                  ),
                )
                .toList(),
            updateImageUrls: const [],
            deleteImageIds: const [],
            reviewRecommendation: ReviewRecommendation.values
                .where(
                  (element) => element.jsonValue == review.recommendation,
                )
                .first,
            isValid: false,
            isLoading: false,
            permissionStatus: null,
            error: null,
            isSucceed: false,
          ),
        ) {
    on<UpdatedReviewScoreChanged>(_onUpdatedReviewScoreChanged);
    on<UpdatedReviewScoreDetailChanged>(_onUpdatedReviewScoreDetailChanged);
    on<UpdatedReviewTextChanged>(_onUpdatedReviewTextChanged);
    on<UpdatedReviewImageChanged>(_onUpdatedReviewImageChanged);
    on<UpdatedReviewImageDeleted>(_onUpdatedReviewImageDeleted);
    on<UpdatedReviewPermissionRequested>(_onUpdatedReviewPermissionRequested);
    on<UpdatedReviewRequested>(_onUpdatedReviewRequested);
  }

  final UserReview review;
  final ReviewRepository reviewRepository;

  FutureOr<void> _onUpdatedReviewScoreChanged(
    UpdatedReviewScoreChanged event,
    Emitter<UpdatedReviewState> emit,
  ) {
    final check = isValid(
      reviewRecommendation: event.recommendation,
    );

    emit(
      state.copyWith(
        reviewRecommendation: event.recommendation,
        isValid: check,
      ),
    );
  }

  FutureOr<void> _onUpdatedReviewScoreDetailChanged(
    UpdatedReviewScoreDetailChanged event,
    Emitter<UpdatedReviewState> emit,
  ) {
    switch (event.reviewCategory) {
      case ReviewCategory.socket:
        final check = isValid(
          socketScore: event.score,
        );

        emit(state.copyWith(
          socketScore: event.score,
          isValid: check,
        ));
        break;
      case ReviewCategory.restroom:
        final check = isValid(
          restroomScore: event.score,
        );
        emit(state.copyWith(
          restroomScore: event.score,
          isValid: check,
        ));
        break;
      case ReviewCategory.table:
        final check = isValid(
          tableScore: event.score,
        );
        emit(state.copyWith(
          tableScore: event.score,
          isValid: check,
        ));
        break;
      case ReviewCategory.wifi:
        final check = isValid(
          wifiScore: event.score,
        );
        emit(state.copyWith(
          wifiScore: event.score,
          isValid: check,
        ));
        break;
    }
  }

  FutureOr<void> _onUpdatedReviewTextChanged(
    UpdatedReviewTextChanged event,
    Emitter<UpdatedReviewState> emit,
  ) {
    final check = isValid(reviewText: event.text);

    emit(
      state.copyWith(
        reviewText: event.text,
        isValid: check,
      ),
    );
  }

  FutureOr<void> _onUpdatedReviewImageChanged(
    UpdatedReviewImageChanged event,
    Emitter<UpdatedReviewState> emit,
  ) {
    emit(state.copyWith(
      imageUrls: [
        ...state.imageUrls,
        ...event.photoList
            .map(
              (e) => ImageTypePair(
                imageUrl: e,
                imageType: ImageType.file,
              ),
            )
            .toList(),
      ],
      updateImageUrls: [
        ...state.updateImageUrls,
        ...event.photoList,
      ],
      isValid: true,
    ));
  }

  FutureOr<void> _onUpdatedReviewImageDeleted(
    UpdatedReviewImageDeleted event,
    Emitter<UpdatedReviewState> emit,
  ) {
    final cur = state.imageUrls;

    cur.remove(
      ImageTypePair(
        imageUrl: event.imageUrl,
        imageType: event.imageType,
      ),
    );

    final deleteImageId = (review.reviewImageIdPairs ?? [])
            .where((element) => element.imageUrl == event.imageUrl)
            .firstOrNull
            ?.imageId ??
        -1;

    emit(
      state.copyWith(
        imageUrls: [...cur],
        deleteImageIds: [
          ...state.deleteImageIds,
          deleteImageId,
        ],
        isValid: true,
      ),
    );
  }

  FutureOr<void> _onUpdatedReviewPermissionRequested(
    UpdatedReviewPermissionRequested event,
    Emitter<UpdatedReviewState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );
    final status = await event.permission.request();
    emit(
      state.copyWith(
        permissionStatus: status,
        isLoading: false,
      ),
    );
  }

  FutureOr<void> _onUpdatedReviewRequested(
    UpdatedReviewRequested event,
    Emitter<UpdatedReviewState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    try {
      final dir = await getApplicationDocumentsDirectory();
      final imagePathList = <String>[];
      for (int i = 0; i < state.updateImageUrls.length; i++) {
        final fileName =
            state.updateImageUrls[i].split('/').last.split('.').first;

        final filePath = '${dir.path}/$fileName.jpg';

        await FlutterImageCompress.compressAndGetFile(
          state.updateImageUrls[i],
          filePath,
          quality: 80,
        );

        imagePathList.add(filePath);
      }

      final response = await reviewRepository.updateReview(
        UpdateReviewRequest(
          reviewId: review.reviewId,
          recommendation: state.reviewRecommendation.jsonValue,
          content: state.reviewText,
          socket: state.socketScore,
          wifi: state.wifiScore,
          restroom: state.wifiScore,
          tableSize: state.tableScore,
          deleteImageIds: state.deleteImageIds,
          updateImageFiles: imagePathList,
        ),
      );

      if (response.code == -1) {
        emit(
          state.copyWith(
            isLoading: false,
            error: Error(),
          ),
        );

        return;
      }

      emit(
        state.copyWith(
          isLoading: false,
          isSucceed: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: e,
          isLoading: false,
        ),
      );
    }
  }

  bool isValid({
    String? wifiScore,
    String? restroomScore,
    String? socketScore,
    String? tableScore,
    String? reviewText,
    ReviewRecommendation? reviewRecommendation,
  }) {
    if (review.detailEvaluation.wifi.toString() ==
            (wifiScore ?? state.wifiScore) &&
        review.detailEvaluation.restroom.toString() ==
            (restroomScore ?? state.restroomScore) &&
        review.detailEvaluation.socket.toString() ==
            (socketScore ?? state.socketScore) &&
        review.detailEvaluation.tableSize.toString() ==
            (tableScore ?? state.tableScore) &&
        review.content == (reviewText ?? state.reviewText) &&
        review.recommendation ==
            (reviewRecommendation ?? state.reviewRecommendation).jsonValue) {
      return false;
    }
    return true;
  }
}
