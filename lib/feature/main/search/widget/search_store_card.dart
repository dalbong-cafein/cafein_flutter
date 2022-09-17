import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/feature/main/search/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/store_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/calculate_distance.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:cafein_flutter/widget/chip/store_additional_information_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class SearchStoreCard extends StatelessWidget {
  const SearchStoreCard({
    Key? key,
    required this.store,
    required this.index,
  }) : super(key: key);

  final Store store;
  final int index;

  @override
  Widget build(BuildContext context) {
    final imageDatas = [...store.imageIdPair ?? []];
    if (imageDatas.length < 4) {
      final length = 4 - imageDatas.length;
      for (int i = 0; i < length; i++) {
        imageDatas.add(
          ImageIdPair(
            imageId: -1,
            imageUrl: CafeinConst.defaultStoreImage,
          ),
        );
      }
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          StoreDetailPage.routeName,
          arguments: store.storeId,
        );
      },
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  store.storeName,
                  style: AppStyle.subTitle16SemiBold,
                ),
                InkWell(
                  onTap: () => context.read<SearchBloc>().add(
                        SearchStoreHeartRequested(
                          isLike: !store.isHeart,
                          index: index,
                        ),
                      ),
                  child: store.isHeart
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
                ),
              ],
            ),
            Row(
              children: [
                OpenCloseChip(
                  isOpen: store.businessInfo?.isOpen ?? false,
                ),
                const SizedBox(width: 4),
                ConfuseChip(
                  confuseScore: store.congestionScoreAvg,
                  height: 18,
                  width: 29,
                  textStyle: AppStyle.caption12Medium,
                ),
              ],
            ),
            const SizedBox(height: 4),
            StoreAdditionalInformationRow(
              textStyle: AppStyle.caption12Regular,
              distance: calculateDistance(
                currentLatLng: context.watch<SearchBloc>().currentLatLng,
                targetLatLng: LatLng(store.latY, store.lngX),
              ),
              recommendScore: store.recommendPercent?.toInt() ?? 0,
              likeCount: store.heartCnt,
              iconSize: 20,
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    3,
                    (index) => CustomCachedNetworkImage(
                      imageUrl: imageDatas[index].imageUrl,
                      width: 70,
                      height: 70,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomCachedNetworkImage(
                          imageUrl: imageDatas[3].imageUrl,
                          width: 70,
                          height: 70,
                        ),
                        if (imageDatas.length >= 5)
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(0.48),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+${imageDatas.length - 4}',
                                style: AppStyle.subTitle15Medium.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
