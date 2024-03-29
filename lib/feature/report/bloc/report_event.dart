part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class ReportCategoryRequested extends ReportEvent {
  @override
  List<Object?> get props => [];
}

class ReportRequested extends ReportEvent {
  final int clickedIndex;
  final String? content;

  const ReportRequested({
    required this.clickedIndex,
    this.content,
  });

  @override
  List<Object?> get props => [
        clickedIndex,
        content,
      ];
}

class ReportCategoryClicked extends ReportEvent {
  final int clickedIndex;
  const ReportCategoryClicked({required this.clickedIndex});
  @override
  List<Object?> get props => [clickedIndex];
}
