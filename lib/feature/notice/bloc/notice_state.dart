part of 'notice_bloc.dart';

abstract class NoticeState extends Equatable {
  const NoticeState();
}

class NoticeInitial extends NoticeState {
  @override
  List<Object> get props => [];
}

class NoticeLoading extends NoticeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NoticeLoaded extends NoticeState{
  final List<Notice> notices;

  const NoticeLoaded({ required this.notices });

  @override
  // TODO: implement props
  List<Object?> get props => [notices]; //값 비교를 위함
}

class NoticeError extends NoticeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


