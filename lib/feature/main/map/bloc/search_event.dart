part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchKeywordChanged extends SearchEvent {
  const SearchKeywordChanged({
    required this.text,
  });

  final String text;

  @override
  List<Object?> get props => [text];
}

class SearchKakaoStoreRequested extends SearchEvent {
  const SearchKakaoStoreRequested({
    this.isMoreRequested = false,
  });

  final bool isMoreRequested;

  @override
  List<Object?> get props => [isMoreRequested];
}

class SearchStoreRequested extends SearchEvent {
  const SearchStoreRequested({
    required this.keyword,
  });

  final String keyword;

  @override
  List<Object?> get props => [keyword];
}

class SearchRecentKeywordRequested extends SearchEvent {
  const SearchRecentKeywordRequested();
}

class SearchRecentKeywordDeleted extends SearchEvent {
  const SearchRecentKeywordDeleted({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}

class SearchRecentKeywordAllDeleted extends SearchEvent {
  const SearchRecentKeywordAllDeleted();
}
