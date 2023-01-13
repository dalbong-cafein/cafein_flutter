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
  const PostStopLoaded();
  @override
  List<Object?> get props => [];

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
