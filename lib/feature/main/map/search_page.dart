import 'package:cafein_flutter/data/model/kakao/kakao_store_response.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/feature/main/map/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/main/map/widget/search/search_empty_result_card.dart';
import 'package:cafein_flutter/feature/main/map/widget/search/search_empty_store_card.dart';
import 'package:cafein_flutter/feature/main/map/widget/search/search_store_result_card.dart';
import 'package:cafein_flutter/feature/main/map/widget/search/search_recent_keyword_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/debouncer.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class SearchPageResult {
  final List<Store> storeList;
  final String keyword;

  const SearchPageResult({
    required this.storeList,
    required this.keyword,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.centerLatLng,
  }) : super(key: key);

  final LatLng centerLatLng;

  static const routeName = 'SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textController = TextEditingController();
  final pagingController =
      PagingController<int, KakaoStoreResponse>(firstPageKey: 1);
  final debouncer = Debouncer(
    milliseconds: 100,
  );

  bool isEditCompleted = false;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<SearchBloc>();
    textController.addListener(() {
      if (textController.text.isNotEmpty && !isEditCompleted) {
        bloc.add(SearchKeywordChanged(text: textController.text));
        debouncer.run(() => bloc.add(const SearchKakaoStoreRequested()));
      }
    });
    pagingController.addPageRequestListener(
      (_) => context.read<SearchBloc>().add(
            const SearchKakaoStoreRequested(
              isMoreRequested: true,
            ),
          ),
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        final navigator = Navigator.of(context);

        if (state is SearchError) {
          isEditCompleted = false;
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is SearchKakaoLoaded) {
          pagingController.value = PagingState(
            itemList: state.storeList,
            nextPageKey: state.nextPage,
            error: null,
          );
        } else if (state is SearchStoreLoaded) {
          isEditCompleted = false;
          if (state.storeList.isEmpty) {
            return;
          }

          navigator.pop(
            SearchPageResult(
              storeList: state.storeList,
              keyword: state.keyword,
            ),
          );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 56,
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: loadAsset(
                AppIcon.left,
                color: AppColor.grey800,
                fit: BoxFit.scaleDown,
              ),
            ),
            titleSpacing: 0,
            title: Container(
              margin: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                right: 16,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.grey50,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      maxLength: 20,
                      autofocus: true,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '대학교, 지하철, 지역, 카페 이름 등으로 검색',
                      ),
                      onEditingComplete: () {
                        isEditCompleted = true;
                        context.read<SearchBloc>().add(
                              SearchStoreRequested(
                                keyword: textController.text,
                              ),
                            );
                      },
                    ),
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    buildWhen: (pre, next) =>
                        next is SearchKeywordValidationChecked,
                    builder: (context, state) {
                      bool isEmpty = true;
                      if (state is SearchKeywordValidationChecked) {
                        isEmpty = state.isEmpty;
                      }

                      if (isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return InkWell(
                        onTap: () => textController.clear(),
                        child: loadAsset(
                          AppIcon.circleDeleteGrey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          body: BlocBuilder<SearchBloc, SearchState>(
            buildWhen: (pre, next) =>
                next is SearchRecentKeywordLoaded ||
                next is SearchKakaoLoaded ||
                next is SearchStoreLoading ||
                next is SearchStoreLoaded,
            builder: (context, state) {
              if (state is SearchRecentKeywordLoaded) {
                if (state.keywordList.isEmpty) {
                  return const SearchEmptyResultCard();
                }

                return SearchRecentKeywordCard(
                  searchDataList: state.keywordList,
                  onTap: (keyword) {
                    isEditCompleted = true;
                    textController.text = keyword;
                    context.read<SearchBloc>().add(
                          SearchStoreRequested(
                            keyword: textController.text,
                          ),
                        );
                  },
                );
              } else if (state is SearchStoreLoading) {
                return const CustomCircleLoadingIndicator();
              } else if (state is SearchStoreLoaded) {
                if (state.storeList.isNotEmpty) {
                  return const SizedBox.shrink();
                }

                return SearchEmptyStoreCard(
                  keyword: state.keyword,
                );
              } else if (state is SearchKakaoLoaded) {
                if (state.storeList.isEmpty) {
                  return const SizedBox.shrink();
                }

                return SafeArea(
                  child: PagedListView.separated(
                    padding: EdgeInsets.zero,
                    pagingController: pagingController,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) => InkWell(
                        onTap: () {
                          isEditCompleted = true;
                          textController.text =
                              state.storeList[index].placeName;
                          context.read<SearchBloc>().add(
                                SearchStoreRequested(
                                  keyword: textController.text,
                                ),
                              );
                        },
                        child: SearchStoreResultCard(
                          keyword: state.keyword,
                          store: state.storeList[index],
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (_) =>
                          const SizedBox.shrink(),
                      newPageProgressIndicatorBuilder: (_) => const SizedBox(
                        height: 64,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                      firstPageErrorIndicatorBuilder: (_) =>
                          const SizedBox.shrink(),
                      newPageErrorIndicatorBuilder: (_) =>
                          const SizedBox.shrink(),
                      noMoreItemsIndicatorBuilder: (_) =>
                          const SizedBox.shrink(),
                      noItemsFoundIndicatorBuilder: (_) => SearchEmptyStoreCard(
                        keyword: state.keyword,
                      ),
                    ),
                    itemExtent: 64,
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: AppColor.grey300,
                    ),
                  ),
                );
              }
              return const SearchEmptyResultCard();
            },
          ),
        ),
      ),
    );
  }
}
