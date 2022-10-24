part of 'terms_bloc.dart';

abstract class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object?> get props => [];
}

class TermsInitial extends TermsState {
  const TermsInitial();
}

class TermsLoading extends TermsState {
  const TermsLoading();
}

class TermsLoaded extends TermsState {
  const TermsLoaded();
}

class TermsError extends TermsState {
  const TermsError({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [error];
}

class TermsChecked extends TermsState {
  const TermsChecked({
    required this.isAllChecked,
    required this.isServiceChecked,
    required this.isPersonalChecked,
    required this.isLocationChecked,
    required this.isMarketingChecked,
    required this.isValid,
  });

  final bool isAllChecked;
  final bool isServiceChecked;
  final bool isPersonalChecked;
  final bool isLocationChecked;
  final bool isMarketingChecked;
  final bool isValid;

  @override
  List<Object?> get props => [
        isAllChecked,
        isServiceChecked,
        isPersonalChecked,
        isLocationChecked,
        isMarketingChecked,
        isValid,
      ];
}
