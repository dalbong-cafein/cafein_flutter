part of 'updated_review_bloc.dart';

abstract class UpdatedReviewEvent extends Equatable {
  const UpdatedReviewEvent();

  @override
  List<Object?> get props => [];
}

class UpdatedReviewScoreChanged extends UpdatedReviewEvent {
  const UpdatedReviewScoreChanged({
    required this.recommendation,
  });

  final ReviewRecommendation recommendation;

  @override
  List<Object?> get props => [recommendation];
}

class UpdatedReviewScoreDetailChanged extends UpdatedReviewEvent {
  const UpdatedReviewScoreDetailChanged({
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

class UpdatedReviewTextChanged extends UpdatedReviewEvent {
  const UpdatedReviewTextChanged({
    required this.text,
  });

  final String text;

  @override
  List<Object?> get props => [text];
}

class UpdatedReviewImageChanged extends UpdatedReviewEvent {
  const UpdatedReviewImageChanged({
    required this.photoList,
  });

  final List<String> photoList;

  @override
  List<Object?> get props => [photoList];
}

class UpdatedReviewImageDeleted extends UpdatedReviewEvent {
  const UpdatedReviewImageDeleted({
    required this.photo,
  });

  final String photo;

  @override
  List<Object?> get props => [photo];
}

class UpdatedReviewPermissionRequested extends UpdatedReviewEvent {
  const UpdatedReviewPermissionRequested({
    required this.permission,
  });

  final Permission permission;
  @override
  List<Object?> get props => [permission];
}

class UpdatedReviewRequested extends UpdatedReviewEvent {
  const UpdatedReviewRequested();
}
