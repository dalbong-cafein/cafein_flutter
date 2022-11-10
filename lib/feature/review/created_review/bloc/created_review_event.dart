part of 'created_review_bloc.dart';

abstract class CreatedReviewEvent extends Equatable {
  const CreatedReviewEvent();

  @override
  List<Object?> get props => [];
}

class CreatedReviewScoreChanged extends CreatedReviewEvent {
  const CreatedReviewScoreChanged({
    required this.recommendation,
  });

  final ReviewRecommendation recommendation;

  @override
  List<Object?> get props => [recommendation];
}

class CreatedReviewScoreDetailChanged extends CreatedReviewEvent {
  const CreatedReviewScoreDetailChanged({
    required this.reviewCategory,
    required this.score,
  });

  final String score;
  final ReviewCategory reviewCategory;

  @override
  List<Object?> get props => [
        score,
        reviewCategory,
      ];
}

class CreatedReviewTextChanged extends CreatedReviewEvent {
  const CreatedReviewTextChanged({
    required this.text,
  });

  final String text;

  @override
  List<Object?> get props => [text];
}

class CreatedReviewRequested extends CreatedReviewEvent {
  const CreatedReviewRequested({
    required this.isAvailable,
  });

  final bool isAvailable;

  @override
  List<Object?> get props => [isAvailable];
}

class CreatedReviewPhotoRequested extends CreatedReviewEvent {
  const CreatedReviewPhotoRequested({
    required this.photoList,
  });

  final List<String> photoList;

  @override
  List<Object?> get props => [photoList];
}

class CreatedReviewPhotoDeleteRequested extends CreatedReviewEvent {
  const CreatedReviewPhotoDeleteRequested({
    required this.photo,
  });

  final String photo;

  @override
  List<Object?> get props => [photo];
}

class CreatedReviewPossibleRequested extends CreatedReviewEvent {
  const CreatedReviewPossibleRequested();
}

class CreatedReviewStickerPossibleRequested extends CreatedReviewEvent {
  const CreatedReviewStickerPossibleRequested();
}

class CreatedReviewStickerRequested extends CreatedReviewEvent {
  const CreatedReviewStickerRequested();
}
