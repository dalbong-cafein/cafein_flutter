part of 'post_stop_bloc.dart';


abstract class PostStopState extends Equatable {
  const PostStopState();
}

class PostStopInitial extends PostStopState {
  const PostStopInitial();
  @override
  List<Object?> get props => [];
}

class PostStopLoading extends PostStopState{
  const PostStopLoading();
  @override
  List<Object?> get props => [];

}

class PostStopLoaded extends PostStopState{
  const PostStopLoaded({
    required this.reportedReview,
    required this.reportCategoryName,
    required this.reportDateTime,
    required this.reportExpiredDateTime
});
  final ReportedReview reportedReview;
  final String reportCategoryName;
  final String reportDateTime;
  final String reportExpiredDateTime;
  @override
  List<Object?> get props => [reportedReview, reportCategoryName, reportDateTime, reportExpiredDateTime];

}

class PostStopError extends PostStopState {
  const PostStopError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
