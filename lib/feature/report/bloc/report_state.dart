part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();
}

class ReportInitial extends ReportState {
  @override
  List<Object?> get props => [];
}

class ReportCategoryLoaded extends ReportState {
  final List<ReportCategory> categories;

  const ReportCategoryLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class ReportLoaded extends ReportState {
  const ReportLoaded();

  @override
  List<Object?> get props => [];
}

class ReportLoading extends ReportState {
  const ReportLoading();

  @override
  List<Object?> get props => [];
}

class ReportError extends ReportState {
  const ReportError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
