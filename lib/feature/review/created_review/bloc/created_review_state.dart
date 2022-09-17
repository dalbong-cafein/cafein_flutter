part of 'created_review_bloc.dart';

@immutable
abstract class CreatedReviewState extends Equatable {
  const CreatedReviewState();
}

class CreatedReviewInitial extends CreatedReviewState {
  @override
  List<Object?> get props => [];
}

class CreatedReviewPermissionChecked extends CreatedReviewState {
  const CreatedReviewPermissionChecked({
    required this.permission,
    required this.permissionStatus,
  });

  final Permission permission;
  final PermissionStatus permissionStatus;

  @override
  List<Object?> get props => [permission, permissionStatus];
}

class CreatedReviewError extends CreatedReviewState{
  const  CreatedReviewError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];

}
