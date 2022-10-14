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

class SearchKakaoLoaded extends SearchState {
  const SearchKakaoLoaded({
    required this.storeList,
    required this.keyword,
    this.nextPage,
  });

  final List<KakaoStoreResponse> storeList;
  final int? nextPage;
  final String keyword;

  @override
  List<Object?> get props => [
        storeList,
        keyword,
        nextPage,
      ];
}

class SearchStoreLoading extends SearchState {
  const SearchStoreLoading();
}

class SearchStoreLoaded extends SearchState {
  const SearchStoreLoaded({
    required this.storeList,
    required this.keyword,
  });

  final List<Store> storeList;
  final String keyword;

  @override
  List<Object?> get props => [
        storeList,
        keyword,
      ];
}

class SearchRecentKeywordLoaded extends SearchState {
  const SearchRecentKeywordLoaded({
    required this.keywordList,
  });

  final List<SearchData> keywordList;

  @override
  List<Object?> get props => [keywordList];
}
