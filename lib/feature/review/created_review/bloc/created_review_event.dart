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
  const CreatedReviewScoreDetailChanged();
}

class CreatedReviewTextChanged extends CreatedReviewEvent {
  const CreatedReviewTextChanged();
}

class CreatedReviewRequested extends CreatedReviewEvent {
  const CreatedReviewRequested();
}

class CreatedReviewPhotoRequested extends CreatedReviewEvent {
  const CreatedReviewPhotoRequested();
}
