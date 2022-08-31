import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'created_review_event.dart';
part 'created_review_state.dart';

class CreatedReviewBloc extends Bloc<CreatedReviewEvent, CreatedReviewState> {
  CreatedReviewBloc() : super(CreatedReviewInitial()) {
    on<CreatedReviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}