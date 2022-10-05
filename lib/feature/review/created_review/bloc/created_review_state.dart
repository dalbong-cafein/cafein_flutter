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
  const CreatedReviewSucceed();
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
