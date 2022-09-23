import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailCard extends StatelessWidget {
  const StoreDetailCard({
    Key? key,
    required this.storeDetail,
  }) : super(key: key);

  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserRepository>().getMemberData;

    return SliverToBoxAdapter(
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
                      storeDetail.storeName,
                      style: AppStyle.title19Bold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      storeDetail.addressInfo.fullAddress,
                      style: AppStyle.caption13Regular.copyWith(
                        color: AppColor.grey600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        OpenCloseChip(
                          isOpen: storeDetail.businessInfo.isOpen ?? false,
                        ),
                        if (storeDetail.businessInfo.closed != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '${storeDetail.businessInfo.closed}에 종료',
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
    );
  }
}