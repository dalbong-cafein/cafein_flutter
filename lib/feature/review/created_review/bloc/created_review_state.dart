part of 'created_review_bloc.dart';

abstract class CreatedReviewState extends Equatable {
  const CreatedReviewState();

  @override
  List<Object?> get props => [];
}

class CreatedReviewInitial extends CreatedReviewState {
  const CreatedReviewInitial();
}

class CreatedReviewPermissionChecked extends CreatedReviewState {
  const CreatedReviewPermissionChecked({
    required this.permission,
    required this.permissionStatus,
  });

  final Permission permission;
  final PermissionStatus permissionStatus;

  @override
  List<Object?> get props => [
        permission,
        permissionStatus,
        DateTime.now(),
      ];
}

class CreatedReviewScoreChecked extends CreatedReviewState {
  const CreatedReviewScoreChecked({
    required this.recommendation,
  });

  final ReviewRecommendation recommendation;

  @override
  List<Object?> get props => [recommendation];
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
