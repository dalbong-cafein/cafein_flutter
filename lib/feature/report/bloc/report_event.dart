part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class ReportCategoryRequested extends ReportEvent {
  @override
  List<Object?> get props => [];
}

class ReportRequested extends ReportEvent {
  @override
  List<Object?> get props => [];
}

class ReportItemClicked extends ReportEvent {
  final int clickedIndex;
  const ReportItemClicked({required this.clickedIndex});
  @override
  List<Object?> get props =>[clickedIndex];
}