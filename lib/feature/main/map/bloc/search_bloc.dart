import 'dart:async';

import 'package:cafein_flutter/data/model/common/search_data.dart';
import 'package:cafein_flutter/data/model/kakao/kakao_store_response.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/repository/app_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.storeRepository,
    required this.appRepository,
  }) : super(const SearchInitial()) {
    on<SearchKeywordChanged>(_onSearchKeywordChanged);
    on<SearchKakaoStoreRequested>(_onSearchKakaoStoreRequested);
    on<SearchRecentKeywordRequested>(_onSearchRecentKeywordRequested);
    on<SearchRecentKeywordDeleted>(_onSearchRecentKeywordDeleted);
    on<SearchRecentKeywordAllDeleted>(_onSearchRecentKeywordAllDeleted);
    on<SearchStoreRequested>(_onSearchStoreRequested);

    add(const SearchRecentKeywordRequested());
  }

  final StoreRepository storeRepository;
  final AppRepository appRepository;

  String keyword = '';

  List<KakaoStoreResponse> kakaoStoreList = [];
  List<SearchData> recentSearchKeywords = [];

  int page = 1;

  FutureOr<void> _onSearchKeywordChanged(
    SearchKeywordChanged event,
    Emitter<SearchState> emit,
  ) {
    keyword = event.text;
    page = 1;
    emit(
      SearchKeywordValidationChecked(
        isEmpty: keyword.isEmpty,
      ),
    );
  }

  FutureOr<void> _onSearchRecentKeywordRequested(
    SearchRecentKeywordRequested event,
    Emitter<SearchState> emit,
  ) {
    emit(const SearchLoading());

    final keywordList = appRepository.getSearchKeyword();

    recentSearchKeywords = [...keywordList];

    emit(
      SearchRecentKeywordLoaded(
        keywordList: [...recentSearchKeywords],
      ),
    );
  }

  FutureOr<void> _onSearchRecentKeywordDeleted(
    SearchRecentKeywordDeleted event,
    Emitter<SearchState> emit,
  ) {
    emit(const SearchLoading());
    recentSearchKeywords.removeAt(event.index);
    appRepository.putSearchKeyword(
      recentSearchKeywords.map((e) => e.keyword).toList(),
    );

    emit(
      SearchRecentKeywordLoaded(
        keywordList: [...recentSearchKeywords],
      ),
    );
  }

  FutureOr<void> _onSearchRecentKeywordAllDeleted(
    SearchRecentKeywordAllDeleted event,
    Emitter<SearchState> emit,
  ) {
    emit(const SearchLoading());
    recentSearchKeywords = [];
    appRepository.putSearchKeyword([]);

    emit(
      const SearchRecentKeywordLoaded(
        keywordList: [],
      ),
    );
  }

  FutureOr<void> _onSearchKakaoStoreRequested(
    SearchKakaoStoreRequested event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());

    if (keyword.length < 2) {
      emit(SearchKakaoLoaded(
        storeList: const [],
        keyword: keyword,
      ));

      return;
    }

    try {
      final response = await storeRepository.getKakaoStores(
        query: keyword,
        page: page++,
        size: 15,
      );

      kakaoStoreList = [
        ...(event.isMoreRequested ? kakaoStoreList : []),
        ...response,
      ];

      emit(
        SearchKakaoLoaded(
          storeList: [...kakaoStoreList],
          keyword: keyword,
          nextPage: response.length == 15 ? 1 : null,
        ),
      );
    } catch (e) {
      emit(
        SearchError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onSearchStoreRequested(
    SearchStoreRequested event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchStoreLoading());

    keyword = event.keyword;
    try {
      recentSearchKeywords.removeWhere(
        (element) => element.keyword == keyword,
      );

      if (recentSearchKeywords.length == 12) {
        recentSearchKeywords.removeLast();
      }

      recentSearchKeywords = [
        SearchData(
          keyword: keyword,
          dateTime: DateTime.now().toString(),
        ),
        ...recentSearchKeywords,
      ];

      appRepository.putSearchKeyword(
        recentSearchKeywords.map((e) => e.keyword).toList(),
      );

      final response = await storeRepository.getStores(
        keyword,
      );

      emit(SearchStoreLoaded(
        storeList: [...response.data],
        keyword: keyword,
      ));
    } catch (e) {
      emit(
        SearchError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }
}