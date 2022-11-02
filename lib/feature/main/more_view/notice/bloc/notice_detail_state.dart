part of 'notice_detail_bloc.dart';

abstract class NoticeDetailState extends Equatable {
  const NoticeDetailState();

  @override
  List<Object?> get props => [];
}

class NoticeDetailInitial extends NoticeDetailState {
  const NoticeDetailInitial();
}

class NoticeDetailLoading extends NoticeDetailState {
  const NoticeDetailLoading();
}

class NoticeDetailLoaded extends NoticeDetailState {
  const NoticeDetailLoaded({
    required this.notice,
  });

  final Board notice;

  @override
  List<Object?> get props => [notice];
}

class NoticeDetailError extends NoticeDetailState {
  const NoticeDetailError({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [error];
}
