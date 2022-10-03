part of 'created_review_bloc.dart';

abstract class CreatedReviewEvent extends Equatable {
  const CreatedReviewEvent();

  @override
  List<Object?> get props => [];
}

class CreatedReviewPermissionRequested extends CreatedReviewEvent {
  const CreatedReviewPermissionRequested({required this.permission});

  final Permission permission;
  @override
  List<Object?> get props => [permission];
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
  const CreatedReviewRequested();
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
