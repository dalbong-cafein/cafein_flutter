import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/image_detail/image_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/am_pm_format.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:flutter/material.dart';

class StoreDetailCard extends StatelessWidget {
  const StoreDetailCard({
    Key? key,
    required this.storeDetail,
  }) : super(key: key);

  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
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
                          imageUrl: storeDetail.imageIdPair?.imageUrl,
                          radius: 10,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          storeDetail.nicknameOfModMember ?? '',
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
                      style: AppStyle.title19SemiBold,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 300,
                      child: Text(
                        storeDetail.addressInfo.fullAddress,
                        style: AppStyle.caption13Regular.copyWith(
                          color: AppColor.grey600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        OpenCloseChip(
                          isOpen: storeDetail.businessInfo.isOpen,
                        ),
                        if (storeDetail.businessInfo.closed != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '${amPmFormat(storeDetail.businessInfo.closed!)}에 종료',
                              style: AppStyle.caption13Regular,
                            ),
                          )
                      ],
                    )
                  ],
                ),
                ConfuseChip(
                  confuseScore: storeDetail.congestionScoreAvg,
                  width: 44,
                  height: 28,
                  textStyle: AppStyle.subTitle16Medium,
                  borderRadius: 8,
                ),
              ],
            ),
            if (storeDetail.storeImageList.isNotEmpty)
              SizedBox(
                height: 240,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: storeDetail.storeImageList.length,
                  itemBuilder: (context, index) {
                    if (index % 3 == 0) {
                      return InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                          ImageDetailPage.routeName,
                          arguments: ImageDetailPageArguments(
                            initialPage: index,
                            imageUrls: storeDetail.storeImageList
                                .map((e) => e.imageUrl)
                                .toList(),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: CustomCachedNetworkImage(
                            imageUrl:
                                storeDetail.storeImageList[index].imageUrl,
                            height: 200,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (index % 3 == 1) {
                      final currentIndex = index;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(
                              ImageDetailPage.routeName,
                              arguments: ImageDetailPageArguments(
                                initialPage: index,
                                imageUrls: storeDetail.storeImageList
                                    .map((e) => e.imageUrl)
                                    .toList(),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: CustomCachedNetworkImage(
                                imageUrl: storeDetail
                                    .storeImageList[currentIndex].imageUrl,
                                height: 96,
                                width: 96,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (index + 1 < storeDetail.storeImageList.length)
                            InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                ImageDetailPage.routeName,
                                arguments: ImageDetailPageArguments(
                                  initialPage: index + 1,
                                  imageUrls: storeDetail.storeImageList
                                      .map((e) => e.imageUrl)
                                      .toList(),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CustomCachedNetworkImage(
                                  imageUrl: storeDetail
                                      .storeImageList[currentIndex + 1]
                                      .imageUrl,
                                  height: 96,
                                  width: 96,
                                  fit: BoxFit.cover,
                                ),
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
