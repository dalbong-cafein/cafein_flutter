import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
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
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: AppColor.grey400,
              ),
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
                        ],
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
