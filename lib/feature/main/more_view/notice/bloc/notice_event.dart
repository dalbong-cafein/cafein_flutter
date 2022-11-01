part of 'notice_bloc.dart';

abstract class NoticeEvent extends Equatable {
  const NoticeEvent();

  @override
  List<Object?> get props => [];
}

class NoticeRequested extends NoticeEvent {
  const NoticeRequested();
}


class NoticeDetailRequested extends NoticeEvent {
  final int clickedBoardId;
  const NoticeDetailRequested({required this.clickedBoardId});
}
