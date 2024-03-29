import 'dart:async';

import 'package:cafein_flutter/data/model/notification/notification.dart';
import 'package:cafein_flutter/data/repository/notification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({
    required this.notificationRepository,
  }) : super(const NotificationInitial()) {
    on<NotificationRequested>(_onNoticeRequested);
    on<NotificationDeleteRequested>(_onNoticeDeleteRequested);
    on<NotificationReadRequested>(_onNoticeReadRequested);
  }
  final NotificationRepository notificationRepository;
  List<Notification> _noticeList = [];

  FutureOr<void> _onNoticeRequested(
    NotificationRequested event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationLoading());
    if (event.isPreview) {
      emit(const NotificationLoaded(notifications: []));

      return;
    }

    try {
      final response = await notificationRepository.getNotices();
      final noticeList = response.data;
      _noticeList = [...noticeList];
      emit(NotificationLoaded(notifications: noticeList));
    } catch (e) {
      emit(NotificationError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onNoticeDeleteRequested(
    NotificationDeleteRequested event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationLoading());
    try {
      await notificationRepository.deleteAllNotice();
      emit(
        const NotificationLoaded(
          notifications: [],
        ),
      );
    } catch (e) {
      emit(NotificationError(
        error: e,
        event: () => add(event),
      ));
    }
  }

  FutureOr<void> _onNoticeReadRequested(
    NotificationReadRequested event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationLoading());
    try {
      await notificationRepository.readNotice(
        _noticeList[event.notificationIndex].notificationId,
      );
      final cur = _noticeList;
      cur[event.notificationIndex] =
          _noticeList[event.notificationIndex].copyWith(
        isRead: true,
      );
      _noticeList = [...cur];

      emit(
        NotificationLoaded(
          notifications: [..._noticeList],
        ),
      );
    } catch (e) {
      emit(NotificationError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
