import 'dart:async';

import 'package:cafein_flutter/data/model/common/search_data.dart';
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
    on<SearchStoreRequested>(_onSearchStoreRequested);
    on<SearchRecentKeywordRequested>(_onSearchRecentKeywordRequested);
    on<SearchRecentKeywordDeleted>(_onSearchRecentKeywordDeleted);
    on<SearchRecentKeywordAllDeleted>(_onSearchRecentKeywordAllDeleted);

    add(const SearchRecentKeywordRequested());
  }

  final StoreRepository storeRepository;
  final AppRepository appRepository;

  String keyword = '';

  List<Store> storeList = [];
  List<SearchData> recentSearchKeywords = [];

  FutureOr<void> _onSearchKeywordChanged(
    SearchKeywordChanged event,
    Emitter<SearchState> emit,
  ) {
    keyword = event.text;
    emit(
      SearchKeywordValidationChecked(
        isEmpty: keyword.isEmpty,
      ),
    );
  }

  FutureOr<void> _onSearchStoreRequested(
    SearchStoreRequested event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());

    try {
      final response = await storeRepository.getStores(
        keyword,
      );

      storeList = [...response.data];

      emit(
        SearchLoaded(
          storeList: [...storeList],
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
}
