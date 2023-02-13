import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_detail_page.dart';
import 'package:cafein_flutter/feature/review/created_review/created_review_page.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_review_impossible_dialog.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_congestion_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_default_information_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_detail_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_detail_event_banner.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_list_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_review_denied_dialog.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_review_list_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_review_request_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_study_information_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/bottom_toast_dialog.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/login_dialog.dart';
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

  final storeTitleKey = GlobalKey();

  bool isScrolled = false;

  final tabTitles = [
    '홈',
    '혼잡도',
    '카공 정보',
    '리뷰',
  ];

  final appBarHeight = AppBar().preferredSize.height;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<StoreDetailBloc>();

    Future.microtask(
      () => bloc.add(
        const StoreDetailRequested(),
      ),
    );

    scrollController.addListener(() {
      bloc.add(StoreDetailScrollChanged(
        offset: scrollController.offset,
      ));

      if (isScrolled) {
        return;
      }

      final storeCongestionPosition = getPosition(storeCongestionKey);
      final storeStudyPosition = getPosition(storeStudyKey);
      final storeReviewPosition = getPosition(storeReviewKey);

      int index = 0;

      if (0 <= storeCongestionPosition - 88 - appBarHeight) {
        index = 0;
      } else if (0 <= storeStudyPosition - 88 - appBarHeight) {
        index = 1;
      } else if (0 <= storeReviewPosition - 88 - appBarHeight) {
        index = 2;
      } else {
        index = 3;
      }

      bloc.add(StoreDetailTabChanged(
        index: index,
        isTaped: false,
      ));
    });
  }

  void animateScroll(int index) async {
    isScrolled = true;
    double offset = 0;

    if (index == 0) {
      offset = getPosition(storeDetailKey);
    } else if (index == 1) {
      offset = getPosition(storeCongestionKey);
    } else if (index == 2) {
      offset = getPosition(storeStudyKey);
    } else if (index == 3) {
      offset = getPosition(storeReviewKey);
    }

    await scrollController.animateTo(
      offset + scrollController.offset - 44 - appBarHeight - 44,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );

    isScrolled = false;
  }

  double getPosition(GlobalKey key) {
    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    return offset.dy;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late StoreDetail storeDetail;

    return BlocListener<StoreDetailBloc, StoreDetailState>(
      listener: (context, state) async {
        if (state is StoreDetailError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is StoreDetailTabChecked) {
          if (!state.isTaped) {
            return;
          }

          animateScroll(state.index);
        } else if (state is StoreDetailHeartChecked) {
          if (state.isInitial) {
            return;
          }

          BottomToastDialog.show(context, isHeart: state.isHeart);
        } else if (state is StoreDetailNearStoreLoaded) {
          if (state.isHeart == null) {
            return;
          }
          BottomToastDialog.show(context, isHeart: state.isHeart!);
        } else if (state is StoreDetailReviewCreatePossible) {
          final bloc = context.read<StoreDetailBloc>();
          final navigator = Navigator.of(context);
          final isPreview =
              context.read<AuthCubit>().state == const AuthPreviewed();
          if (state.isCreatePossible) {
            if (isPreview) {
              final result = await LoginDialog.show(context);
              if (!result) {
                return;
              }
              return navigator.popUntil((route) => false);
            }
            await navigator.pushNamed(
              CreatedReviewPage.routeName,
              arguments: CreateReviewPageArguments(
                storeDetail: storeDetail,
                recommendation: state.recommendation,
              ),
            );
            bloc.add(const StoreDetailReviewRequested());
          } else {
            if (state.reviewDeniedReason == "하루당 한 카페에 리뷰 등록은 한번만 가능합니다.") {
              CreatedReviewImpossibleDialog.show(context);
            } else {
              await StoreReviewDeniedDialog.show(context);
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              Navigator.of(context).pop();
            },
            icon: loadAsset(AppIcon.left),
          ),
          title: BlocBuilder<StoreDetailBloc, StoreDetailState>(
            buildWhen: (pre, next) => next is StoreDetailScrollChecked,
            builder: (context, state) {
              if (state is! StoreDetailScrollChecked) {
                return const SizedBox.shrink();
              }

              if (state.offset <= 68) {
                return const SizedBox.shrink();
              }

              return Text(
                context.watch<StoreDetailBloc>().storeName,
              );
            },
          ),
          actions: [
            BlocBuilder<StoreDetailBloc, StoreDetailState>(
              buildWhen: (pre, next) => next is StoreDetailHeartChecked,
              builder: (context, state) {
                if (state is StoreDetailHeartChecked) {
                  return IconButton(
                    onPressed: () async {
                      final bloc = context.read<StoreDetailBloc>();
                      final navigator = Navigator.of(context);
                      final isPreview = context.read<AuthCubit>().state ==
                          const AuthPreviewed();

                      if (isPreview) {
                        final result = await LoginDialog.show(context);

                        if (!result) {
                          return;
                        }

                        return navigator
                            .popUntil(ModalRoute.withName(LoginPage.routeName));
                      }

                      bloc.add(
                        StoreDetailHeartRequested(isHeart: !state.isHeart),
                      );
                    },
                    icon: state.isHeart
                        ? loadAsset(
                            AppIcon.heartFill,
                            color: AppColor.orange500,
                          )
                        : loadAsset(
                            AppIcon.heartLine,
                            color: AppColor.grey300,
                          ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: BlocBuilder<StoreDetailBloc, StoreDetailState>(
          buildWhen: (pre, next) => next is StoreDetailLoaded,
          builder: (context, state) {
            if (state is StoreDetailLoaded) {
              storeDetail = state.storeDetail;
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
                                  onTap: () =>
                                      context.read<StoreDetailBloc>().add(
                                            StoreDetailTabChanged(
                                              index: index,
                                              isTaped: true,
                                            ),
                                          ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 12),
                                      Text(
                                        tabTitles[index],
                                        style: index == currentIndex
                                            ? AppStyle.subTitle15Bold
                                            : AppStyle.subTitle15Medium
                                                .copyWith(
                                                color: AppColor.grey400,
                                              ),
                                      ),
                                      const Spacer(),
                                      if (index == currentIndex)
                                        Container(
                                          height: 2,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(1),
                                            ),
                                            color: AppColor.grey800,
                                          ),
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
                      height: 10,
                      color: AppColor.grey50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StoreCongestionCard(
                      key: storeCongestionKey,
                      latY: state.storeDetail.latY,
                      lngX: state.storeDetail.lngX,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 10,
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
                      height: 10,
                      color: AppColor.grey50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StoreReviewRequestCard(
                      key: storeReviewKey,
                      reviewCount: state.reviewResponse.reviewCnt,
                      storeDetail: state.storeDetail,
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
                    child: StoreReviewListCard(
                      reviewCount: state.reviewResponse.reviewCnt,
                      reviews: state.reviewResponse.reviewData.reviewList,
                      storeDetail: state.storeDetail,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 10,
                      color: AppColor.grey50,
                    ),
                  ),
                  const StoreListCard(),
                  SliverToBoxAdapter(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        NoticeDetailPage.routeName,
                        arguments: state.latestEvent.boardId,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: StoreDetailEventBanner(
                          imageUrl: state.latestEvent.imageIdPair.imageUrl,
                        ),
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
