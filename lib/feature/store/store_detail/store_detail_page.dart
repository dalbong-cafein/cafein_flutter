import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
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
    final userData = context.watch<UserRepository>().getMemberData;
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
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        right: 24,
                        left: 16,
                        bottom: 24,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleProfileImage(
                                        imageUrl: userData?.imageIdPair?.imageUrl,
                                        radius: 10,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${userData?.nickname}',
                                        style: AppStyle.caption13SemiBold.copyWith(
                                          color: AppColor.grey700,
                                        ),
                                      ),
                                      Text(
                                        '님의 제보',
                                        style: AppStyle.caption13Regular.copyWith(
                                          color: AppColor.grey600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    state.storeDetail.storeName,
                                    style: AppStyle.title19Bold,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    state.storeDetail.addressInfo.fullAddress,
                                    style: AppStyle.caption13Regular.copyWith(
                                      color: AppColor.grey600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      OpenCloseChip(
                                        isOpen: state.storeDetail.businessInfo.isOpen ?? false,
                                      ),
                                      if (state.storeDetail.businessInfo.closed != null)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            '${state.storeDetail.businessInfo.closed}에 종료',
                                            style: AppStyle.caption13Regular,
                                          ),
                                        )
                                    ],
                                  )
                                ],
                              ),
                              const ConfuseChip(
                                confuseScore: 2,
                                width: 44,
                                height: 28,
                                textStyle: AppStyle.subTitle16Medium,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 240,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                if (index % 3 == 0) {
                                  return const ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: CustomCachedNetworkImage(
                                      imageUrl: CafeinConst.defaultStoreImage,
                                      height: 200,
                                      width: 160,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  );
                                } else if (index % 3 == 1) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: CustomCachedNetworkImage(
                                          imageUrl: CafeinConst.defaultStoreImage,
                                          height: 96,
                                          width: 96,
                                        ),
                                      ),
                                      if (index + 1 < 8)
                                        const ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: CustomCachedNetworkImage(
                                            imageUrl: CafeinConst.defaultStoreImage,
                                            height: 96,
                                            width: 96,
                                          ),
                                        ),
                                    ],
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                              separatorBuilder: (context, index) {
                                if (index % 3 == 2) {
                                  return const SizedBox.shrink();
                                }
                                return const SizedBox(width: 8);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 1000,
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
