part of 'post_stop_bloc.dart';


abstract class PostStopEvent extends Equatable{
  const PostStopEvent();
}

class PostStopInformRequested extends PostStopEvent{
  const PostStopInformRequested({required this.noticeId});
  final int noticeId;

  @override
  List<Object?> get props => [noticeId];

}


