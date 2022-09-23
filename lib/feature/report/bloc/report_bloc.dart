import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafein_flutter/data/model/report/report_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportEvent>((event, emit) {
    });
  }
}