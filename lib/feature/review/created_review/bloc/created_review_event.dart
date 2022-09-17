part of 'created_review_bloc.dart';


abstract class CreatedReviewEvent extends Equatable{
  const CreatedReviewEvent();

}

class CreatedReviewPermissionRequested extends CreatedReviewEvent{
  const CreatedReviewPermissionRequested({required this.permission});

  final Permission permission;
  @override

  List<Object?> get props => [permission];

}

