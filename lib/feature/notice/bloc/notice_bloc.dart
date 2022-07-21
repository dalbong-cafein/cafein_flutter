import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/repository/notice_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/notice/notice.dart';

part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  NoticeBloc({required this.noticeRepository}) : super(NoticeInitial()) {
    //작성한 행위(Event) 들
    on<NoticeRequested>(_onNoticeRequested);
    on<NoticeDeleteRequested>(_onNoticeDeleteRequested);
    on<NoticeReadRequested>(_onNoticeReadRequested);
  }
  final NoticeRepository noticeRepository;
  List<Notice> _noticeList =[];

  FutureOr<void> _onNoticeRequested(NoticeRequested event, Emitter<NoticeState> emit,) async {
    emit(NoticeLoading());
    try{
      final response = await noticeRepository.getNotices();
      final noticeList = response.data;
      _noticeList = [...noticeList];
      emit(NoticeLoaded(notices: noticeList));
    }catch(e){
      emit(NoticeError());
    }
  }

  FutureOr<void> _onNoticeDeleteRequested(NoticeDeleteRequested event, Emitter<NoticeState> emit) async {
    emit(NoticeLoading());
    try{
      final response = await noticeRepository.deleteNotice(_noticeList[event.noticeIndex].noticeId);
      _noticeList.removeAt(event.noticeIndex);
      emit(NoticeLoaded(notices: [..._noticeList]));
    }catch(e){
      emit(NoticeError());
    }
  }

  FutureOr<void> _onNoticeReadRequested(NoticeReadRequested event, Emitter<NoticeState> emit) async{
    emit(NoticeLoading());
    try{
      final response = await noticeRepository.readNotice(_noticeList[event.noticeIndex].noticeId);
      var cur = _noticeList;
      cur[event.noticeIndex] = _noticeList[event.noticeIndex].copyWith(isRead: true);
      emit(NoticeLoaded(notices: [...cur]));
    }catch(e){
      emit(NoticeError());
    }
  }
}
