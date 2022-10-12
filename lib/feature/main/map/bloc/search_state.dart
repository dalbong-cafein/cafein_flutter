part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchError extends SearchState {
  const SearchError({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [error];
}

class SearchKeywordValidationChecked extends SearchState {
  const SearchKeywordValidationChecked({
    required this.isEmpty,
  });

  final bool isEmpty;

  @override
  List<Object?> get props => [isEmpty];
}

class SearchLoaded extends SearchState {
  const SearchLoaded({
    required this.storeList,
  });

  final List<Store> storeList;

  @override
  List<Object?> get props => [storeList];
}

class SearchRecentKeywordLoaded extends SearchState {
  const SearchRecentKeywordLoaded({
    required this.keywordList,
  });

  final List<SearchData> keywordList;

  @override
  List<Object?> get props => [keywordList];
}
