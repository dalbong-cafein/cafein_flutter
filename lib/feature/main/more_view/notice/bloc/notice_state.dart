part of 'notice_bloc.dart';

abstract class NoticeState extends Equatable {
  const NoticeState();

  @override
  List<Object?> get props => [];
}

class NoticeInitial extends NoticeState {
  const NoticeInitial();
}

class NoticeLoading extends NoticeState {
  const NoticeLoading();
}

class NoticeLoaded extends NoticeState {
  const NoticeLoaded({
    required this.boards,
  });

  final List<Board> boards;

  @override
  List<Object?> get props => [boards];
}

class NoticeError extends NoticeState {
  const NoticeError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
