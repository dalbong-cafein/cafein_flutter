part of 'registered_review_bloc.dart';

abstract class RegisteredReviewEvent extends Equatable {
  const RegisteredReviewEvent();

  @override
  List<Object?> get props => [];
}

class RegisteredReviewRequested extends RegisteredReviewEvent {
  const RegisteredReviewRequested();
}
