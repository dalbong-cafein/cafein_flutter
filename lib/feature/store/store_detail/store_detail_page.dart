import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_congestion_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_default_information_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_detail_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_review_list_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_review_request_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_study_information_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailPage extends StatefulWidget {
  const StoreDetailPage({
    Key? key,
    required this.storeId,
  }) : super(key: key);

  static const routeName = 'StoreDetailPage';

  final int storeId;

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  final scrollController = ScrollController();

  final storeDetailKey = GlobalKey();
  final storeCongestionKey = GlobalKey();
  final storeStudyKey = GlobalKey();
  final storeReviewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<StoreDetailBloc>().add(
            StoreDetailRequested(
              storeId: widget.storeId,
            ),
          ),
    );
  }

  void animateScroll(int index) {
    double offset = 0;
    final appBarHeight = AppBar().preferredSize.height;

    if (index == 0) {
      final renderBox = storeDetailKey.currentContext!.findRenderObject() as RenderBox;
      final widgetOffset = renderBox.localToGlobal(Offset.zero);
      offset = widgetOffset.dy;
    } else if (index == 1) {
      final renderBox = storeCongestionKey.currentContext!.findRenderObject() as RenderBox;
      final widgetOffset = renderBox.localToGlobal(Offset.zero);
      offset = widgetOffset.dy;
    } else if (index == 2) {
      final renderBox = storeStudyKey.currentContext!.findRenderObject() as RenderBox;
      final widgetOffset = renderBox.localToGlobal(Offset.zero);
      offset = widgetOffset.dy;
    } else if (index == 3) {
      final renderBox = storeReviewKey.currentContext!.findRenderObject() as RenderBox;
      final widgetOffset = renderBox.localToGlobal(Offset.zero);
      offset = widgetOffset.dy;
    }

    scrollController.animateTo(
      offset - 44 - appBarHeight - 44 + scrollController.offset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final tabTitles = [
      '홈',
      '혼잡도',
      '카공 정보',
      '리뷰',
    ];

    return BlocListener<StoreDetailBloc, StoreDetailState>(
      listener: (context, state) {
        if (state is StoreDetailError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is StoreDetailTabChecked) {
          animateScroll(state.index);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: AppColor.grey400,
              ),
            ),
            BlocBuilder<StoreDetailBloc, StoreDetailState>(
              buildWhen: (pre, next) => next is StoreDetailHeartChecked,
              builder: (context, state) {
                if (state is StoreDetailHeartChecked) {
                  return IconButton(
                    onPressed: () => context.read<StoreDetailBloc>().add(
                          StoreDetailHeartRequested(
                            isHeart: !state.isHeart,
                            storeId: widget.storeId,
                          ),
                        ),
                    icon: state.isHeart
                        ? const Icon(
                            Icons.favorite,
                            size: 32,
                            color: AppColor.orange500,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            size: 32,
                            color: AppColor.grey300,
                          ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: BlocBuilder<StoreDetailBloc, StoreDetailState>(
          buildWhen: (pre, next) => next is StoreDetailLoaded,
          builder: (context, state) {
            if (state is StoreDetailLoaded) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  StoreDetailCard(
                    storeDetail: state.storeDetail,
                  ),
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 44,
                    backgroundColor: AppColor.white,
                    automaticallyImplyLeading: false,
                    titleSpacing: 0,
                    centerTitle: false,
                    title: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.grey100,
                          ),
                        ),
                      ),
                      child: BlocBuilder<StoreDetailBloc, StoreDetailState>(
                        buildWhen: (pre, next) => next is StoreDetailTabChecked,
                        builder: (context, state) {
                          int currentIndex = 0;
                          if (state is StoreDetailTabChecked) {
                            currentIndex = state.index;
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) => Expanded(
                                child: InkWell(
                                  onTap: () => context.read<StoreDetailBloc>().add(
                                        StoreDetailTabChanged(
                                          index: index,
                                        ),
                                      ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 12),
                                      Text(
                                        tabTitles[index],
                                        style: index == currentIndex
                                            ? AppStyle.subTitle15Bold
                                            : AppStyle.subTitle15Medium.copyWith(
                                                color: AppColor.grey400,
                                              ),
                                      ),
                                      const Spacer(),
                                      if (index == currentIndex)
                                        Container(
                                          height: 1,
                                          width: (width - 32) / 4,
                                          color: AppColor.grey800,
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StoreDefaultInformationCard(
                      key: storeDetailKey,
                      storeDetail: state.storeDetail,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 12,
                      color: AppColor.grey50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StoreCongestionCard(
                      key: storeCongestionKey,
                      congestionResponse: state.congestionResponse,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 12,
                      color: AppColor.grey50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StoreStudyInformationCard(
                      key: storeStudyKey,
                      reviewDetailScore: state.reviewDetailScore,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 12,
                      color: AppColor.grey50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StoreReviewRequestCard(
                      key: storeReviewKey,
                      reviewCount: state.reviewResponse.reviewCnt,
                      storeName: state.storeDetail.storeName,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: 1,
                      color: AppColor.grey50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: StoreReviewListCard(
                        reviewCount: state.reviewResponse.reviewCnt,
                        reviews: state.reviewResponse.reviewData.reviewList,
                      ),
                    ),
                  ),
                ],
              );
            }

            return const CustomCircleLoadingIndicator();
          },
        ),
      ),
    );
  }
}
