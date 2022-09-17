part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {}

class ReportListRequested extends ReportEvent {
  @override
  List<Object?> get props => [];
}

class ReportRequested extends ReportEvent {
  @override
  List<Object?> get props => [];
}

class ReportItemClicked extends ReportEvent {
  final int clickedIndex;
  ReportItemClicked({required this.clickedIndex});
  @override
  List<Object?> get props =>[clickedIndex];
}