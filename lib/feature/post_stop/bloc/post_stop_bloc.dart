import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_stop_event.dart';
part 'post_stop_state.dart';

class PostStopBloc extends Bloc<PostStopEvent, PostStopState> {
  PostStopBloc() : super(PostStopInitial()) {
    on<PostStopEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
