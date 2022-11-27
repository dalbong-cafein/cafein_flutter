import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/review/created_review/created_review_page.dart';
import 'package:cafein_flutter/feature/review/store_review/bloc/store_review_bloc.dart';
import 'package:cafein_flutter/feature/review/store_review/widget/store_review_list_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/login_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StoreReviewListPage extends StatefulWidget {
  const StoreReviewListPage({
    Key? key,
    required this.storeDetail,
  }) : super(key: key);

  static const routeName = 'StoreReviewListPage';

  final StoreDetail storeDetail;

  @override
  State<StoreReviewListPage> createState() => _StoreReviewListPageState();
}

class _StoreReviewListPageState extends State<StoreReviewListPage> {
  final pagingController = PagingController<int, StoreReview>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    super.initState();

    pagingController.addPageRequestListener(
      (_) => context.read<StoreReviewBloc>().add(
            const StoreReviewRequested(),
          ),
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreReviewBloc, StoreReviewState>(
      listener: (context, state) async {
        if (state is StoreReviewError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is StoreReviewLoaded) {
          pagingController.value = PagingState(
            itemList: state.storeReviewList,
            nextPageKey: state.nextPage,
            error: null,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: loadAsset(AppIcon.left),
          ),
          title: BlocBuilder<StoreReviewBloc, StoreReviewState>(
            buildWhen: (pre, next) => next is StoreReviewLoaded,
            builder: (context, state) {
              String title = '리뷰';
              if (state is StoreReviewLoaded) {
                title = '리뷰 ${state.totalCount}';
              }
              return Text(title);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 16,
              ),
              child: InkWell(
                onTap: () async {
                  final bloc = context.read<StoreReviewBloc>();

                  final navigator = Navigator.of(context);

                  final isPreview =
                      context.read<AuthCubit>().state == const AuthPreviewed();

                  if (isPreview) {
                    final result = await LoginDialog.show(context);

                    if (!result) {
                      return;
                    }

                    return navigator
                        .popUntil(ModalRoute.withName(LoginPage.routeName));
                  }

                  await navigator.pushNamed(
                    CreatedReviewPage.routeName,
                    arguments: CreateReviewPageArguments(
                      storeDetail: widget.storeDetail,
                    ),
                  );

                  bloc.add(const StoreReviewResetRequested());
                },
                child: Text(
                  '리뷰쓰기',
                  style: AppStyle.subTitle14Medium.copyWith(
                    color: AppColor.orange500,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 42,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    BlocBuilder<StoreReviewBloc, StoreReviewState>(
                      buildWhen: (pre, next) => next is StoreReviewLoaded,
                      builder: (context, state) {
                        if (state is! StoreReviewLoaded) {
                          return const CustomCircleLoadingIndicator();
                        }

                        return InkWell(
                          onTap: () => context.read<StoreReviewBloc>().add(
                                StoreReviewTypeChanged(
                                  isPhotoReviews: !state.isPhotoReview,
                                ),
                              ),
                          child: loadAsset(
                            state.isPhotoReview
                                ? AppIcon.checkRectangleOn
                                : AppIcon.checkRectangleOff,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '사진 리뷰만',
                      style: AppStyle.subTitle14Medium,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PagedListView(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<StoreReview>(
                  itemBuilder: (context, item, index) => StoreReviewListCard(
                    review: item,
                    index: index,
                    storeId: widget.storeDetail.storeId,
                    storeName: widget.storeDetail.storeName,
                    storeImageIdPair:
                        widget.storeDetail.storeImageList.firstOrNull,
                  ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const CustomCircleLoadingIndicator(),
                  firstPageErrorIndicatorBuilder: (context) =>
                      const SizedBox.shrink(),
                  newPageErrorIndicatorBuilder: (context) =>
                      const SizedBox.shrink(),
                  newPageProgressIndicatorBuilder: (context) =>
                      const CustomCircleLoadingIndicator(),
                  noMoreItemsIndicatorBuilder: (context) =>
                      const SizedBox.shrink(),
                  noItemsFoundIndicatorBuilder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewPadding.bottom,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          loadAsset(AppIcon.textBlank),
                          const SizedBox(height: 12),
                          Text(
                            '작성한 리뷰가 없어요',
                            style: AppStyle.caption13Regular.copyWith(
                              color: AppColor.grey600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
