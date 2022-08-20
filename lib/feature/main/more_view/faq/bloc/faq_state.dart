part of 'faq_bloc.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object?> get props => [];
}

class FaqInitial extends FaqState {
  const FaqInitial();
}

class FaqLoading extends FaqState {
  const FaqLoading();
}

class FaqLoaded extends FaqState {
  const FaqLoaded({
    required this.faqs,
  });

  final List<Board> faqs;

  @override
  List<Object?> get props => [faqs];
}

class FaqError extends FaqState {
  const FaqError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}
