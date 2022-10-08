part of 'created_review_bloc.dart';

abstract class CreatedReviewState extends Equatable {
  const CreatedReviewState();

  @override
  List<Object?> get props => [];
}

class CreatedReviewInitial extends CreatedReviewState {
  const CreatedReviewInitial();
}

class CreatedReviewLoading extends CreatedReviewState {
  const CreatedReviewLoading();
}

class CreatedReviewSucceed extends CreatedReviewState {
  const CreatedReviewSucceed({
    required this.isAvailable,
  });

  final bool isAvailable;

  @override
  List<Object?> get props => [isAvailable];
}

class CreatedReviewStickerCountLoaded extends CreatedReviewState {
  const CreatedReviewStickerCountLoaded({
    required this.isAvailable,
  });

  final bool isAvailable;

  @override
  List<Object?> get props => [isAvailable];
}

class CreatedReviewStickerLoaded extends CreatedReviewState {
  const CreatedReviewStickerLoaded();
}

class CreatedReviewStickerError extends CreatedReviewState {
  const CreatedReviewStickerError();
}

class CreatedReviewScoreChecked extends CreatedReviewState {
  const CreatedReviewScoreChecked({
    this.recommendation,
    required this.wifiScore,
    required this.restroomScore,
    required this.tableScore,
    required this.socketScore,
    required this.isValid,
  });

  final ReviewRecommendation? recommendation;
  final String wifiScore;
  final String restroomScore;
  final String tableScore;
  final String socketScore;
  final bool isValid;

  @override
  List<Object?> get props => [
        recommendation,
        wifiScore,
        restroomScore,
        tableScore,
        socketScore,
        isValid,
      ];
}

class CreatedReviewPhotoSelected extends CreatedReviewState {
  const CreatedReviewPhotoSelected({
    required this.photos,
  });

  final List<String> photos;

  @override
  List<Object?> get props => [photos];
}

class CreatedReviewError extends CreatedReviewState {
  const CreatedReviewError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
