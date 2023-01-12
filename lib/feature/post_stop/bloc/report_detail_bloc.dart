import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_detail_event.dart';
part 'report_detail_state.dart';

class ReportDetailBloc extends Bloc<ReportDetailEvent, ReportDetailState> {
  ReportDetailBloc() : super(ReportDetailInitial()) {
    on<ReportDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
