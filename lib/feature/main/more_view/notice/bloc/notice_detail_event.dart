part of 'notice_detail_bloc.dart';

abstract class NoticeDetailEvent extends Equatable {
  const NoticeDetailEvent();

  @override
  List<Object?> get props => [];
}

class NoticeDetailRequested extends NoticeDetailEvent {
  const NoticeDetailRequested();
}
