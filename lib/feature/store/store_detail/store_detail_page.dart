import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_detail_card.dart';
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<StoreDetailBloc, StoreDetailState>(
      listener: (context, state) {
        if (state is StoreDetailError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
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
                slivers: [
                  StoreDetailCard(
                    storeDetail: state.storeDetail,
                  ),
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 44,
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
                          final tabTitles = [
                            '홈',
                            '혼잡도',
                            '카공 정보',
                            '리뷰',
                          ];
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '기본 정보',
                            style: AppStyle.subTitle17SemiBold,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                (state.storeDetail.businessInfo.isOpen ?? false) ? '영업 중' : '영업 종료',
                                style: (state.storeDetail.businessInfo.isOpen ?? false)
                                    ? AppStyle.subTitle14Medium.copyWith(
                                        color: AppColor.orange500,
                                      )
                                    : AppStyle.subTitle14Medium.copyWith(
                                        color: AppColor.grey500,
                                      ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '오후 11:30에 영업 종료',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                (state.storeDetail.businessInfo.isOpen ?? false) ? '영업 중' : '영업 종료',
                                style: (state.storeDetail.businessInfo.isOpen ?? false)
                                    ? AppStyle.subTitle14Medium.copyWith(
                                        color: AppColor.orange500,
                                      )
                                    : AppStyle.subTitle14Medium.copyWith(
                                        color: AppColor.grey500,
                                      ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '오후 11:30에 영업 종료',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                (state.storeDetail.businessInfo.isOpen ?? false) ? '영업 중' : '영업 종료',
                                style: (state.storeDetail.businessInfo.isOpen ?? false)
                                    ? AppStyle.subTitle14Medium.copyWith(
                                        color: AppColor.orange500,
                                      )
                                    : AppStyle.subTitle14Medium.copyWith(
                                        color: AppColor.grey500,
                                      ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '오후 11:30에 영업 종료',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            height: 1,
                            color: AppColor.grey50,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '잘못된 정보가 있다면 알려주세요',
                                    style: AppStyle.caption13Regular.copyWith(
                                      color: AppColor.grey600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '마지막 수정일',
                                    style: AppStyle.caption11Regular.copyWith(
                                      color: AppColor.grey500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32,
                                width: 80,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      side: BorderSide(
                                        color: AppColor.grey400,
                                      ),
                                    ),
                                    primary: AppColor.white,
                                    onPrimary: AppColor.grey800,
                                    textStyle: AppStyle.subTitle14Medium,
                                  ),
                                  child: const Text('정보 수정'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 12,
                      color: AppColor.grey50,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 280,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 12,
                      color: AppColor.grey50,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 220,
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
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
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
