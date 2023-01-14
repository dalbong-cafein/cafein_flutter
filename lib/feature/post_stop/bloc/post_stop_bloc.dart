import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/enum/board_category.dart';
import 'package:cafein_flutter/data/model/review/reported_review.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_stop_event.dart';
part 'post_stop_state.dart';

class PostStopBloc extends Bloc<PostStopEvent, PostStopState> {
  PostStopBloc() : super(const PostStopInitial()) {
    on<PostStopEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> _onPostStopInformRequested(
    PostStopInformRequested event,
    Emitter<PostStopState> emit
  )async {
    emit(const PostStopLoading());
  }


}
