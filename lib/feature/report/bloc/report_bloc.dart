import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/report/report_category.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'report_event.dart';

part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc({required this.reviewRepository}) : super(ReportInitial()) {
    on<ReportCategoryRequested>(_onReportCategoryRequested);
  }

  final ReviewRepository reviewRepository;

  FutureOr<void> _onReportCategoryRequested(
    ReportCategoryRequested event,
    Emitter<ReportState> emit,
  ) async {
    emit(const ReportLoading());
    try {
      final categoryResponse = await reviewRepository.getReportCategories();
      final categories = categoryResponse.data;
      emit(ReportCategoryLoaded(categories: [...categories]));
    } catch (e) {
      emit(ReportError(
        error: e,
        event: () => add(event),
      ));
    }
  }
}
