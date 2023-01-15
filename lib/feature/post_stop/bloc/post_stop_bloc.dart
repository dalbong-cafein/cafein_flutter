import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/review/reported_review.dart';
import 'package:cafein_flutter/data/repository/notification_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_stop_event.dart';

part 'post_stop_state.dart';

class PostStopBloc extends Bloc<PostStopEvent, PostStopState> {
  PostStopBloc({required this.notificationRepository})
      : super(const PostStopInitial()) {
    on<PostStopInformRequested>(_onPostStopInformRequested);
  }

  final NotificationRepository notificationRepository;

  FutureOr<void> _onPostStopInformRequested(PostStopInformRequested event,
      Emitter<PostStopState> emit) async {
    emit(const PostStopLoading());
    try{
      final response = await notificationRepository.getReportNotification(
          event.noticeId);
      final data = response.data;
      final reportedReview = data.reportedReviewResDto;
      final reportCategoryName = data.reportCategoryName;
      final reportDateTime = data.reportedReviewResDto.regDateTime;
      final reportExpiredDateTime = data.reportExpiredDateTime;
      final isPossibleObjection = data.isPossibleObjection;
      emit(PostStopLoaded(reportedReview: reportedReview,
          reportCategoryName: reportCategoryName,
          reportDateTime: reportDateTime,
          reportExpiredDateTime: reportExpiredDateTime,
          isPossibleObjection: isPossibleObjection
      ));
    }catch(e){
      emit(PostStopError(
        error: e,
        event: () => add(event),
      ));
    }


  }


}
