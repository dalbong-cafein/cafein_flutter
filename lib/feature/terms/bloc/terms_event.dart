part of 'terms_bloc.dart';

abstract class TermsEvent extends Equatable {
  const TermsEvent();

  @override
  List<Object?> get props => [];
}

class TermsRequested extends TermsEvent {
  const TermsRequested();
}

class TermsToggled extends TermsEvent {
  const TermsToggled({
    required this.termsContents,
    required this.isCheck,
  });

  final TermsContents termsContents;
  final bool isCheck;

  @override
  List<Object?> get props => [
        termsContents,
        isCheck,
      ];
}
