part of 'notice_bloc.dart';

abstract class NoticeEvent extends Equatable {
  const NoticeEvent();
}
class NoticeRequested extends NoticeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NoticeDeleteRequested extends NoticeEvent{
  //API 에서 필요한 인자 (보통)
  final int noticeIndex;
  const NoticeDeleteRequested({ required this.noticeIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [noticeIndex];
}

class NoticeReadRequested extends NoticeEvent{

  final int noticeIndex;
  const NoticeReadRequested({ required this.noticeIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [noticeIndex];

}