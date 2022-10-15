import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/store_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/calculate_distance.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:cafein_flutter/widget/chip/store_additional_information_row.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class StoreListCard extends StatefulWidget {
  const StoreListCard({
    super.key,
  });

  @override
  State<StoreListCard> createState() => _StoreListCardState();
}

class _StoreListCardState extends State<StoreListCard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<StoreDetailBloc>().add(
            const StoreDetailNearStoreRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 256,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: BlocBuilder<StoreDetailBloc, StoreDetailState>(
            buildWhen: (pre, next) => next is StoreDetailNearStoreLoaded,
            builder: (context, state) {
              if (state is StoreDetailNearStoreLoaded) {
                final storeList = state.storeList;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '근처에 있는 카공 카페를 찾아봤어요',
                        style: AppStyle.subTitle17SemiBold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final imageList = [
                            ...storeList[index].imageIdPair ?? []
                          ];
                          if (imageList.length < 3) {
                            final length = 3 - imageList.length;
                            for (int i = 0; i < length; i++) {
                              imageList.add(
                                ImageIdPair(
                                  imageId: -1,
                                  imageUrl: CafeinConst.defaultStoreImage,
                                ),
                              );
                            }
                          }
                          return InkWell(
                            onTap: () => Navigator.of(context).pushNamed(
                              StoreDetailPage.routeName,
                              arguments: storeList[index].storeId,
                            ),
                            child: Container(
                              height: 176,
                              width: 256,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 16,
                                    offset: Offset(2, 2),
                                    color: Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.1,
                                    ),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...List.generate(
                                          imageList.length,
                                          (imageIndex) => ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            child: CustomCachedNetworkImage(
                                              imageUrl: imageList[imageIndex]
                                                  .imageUrl,
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    storeList[index].storeName,
                                    style: AppStyle.subTitle15Medium,
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  OpenCloseChip(
                                                    isOpen: storeList[index]
                                                            .businessInfo
                                                            ?.isOpen ??
                                                        false,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  ConfuseChip(
                                                    confuseScore:
                                                        storeList[index]
                                                            .congestionScoreAvg,
                                                    height: 18,
                                                    width: 29,
                                                    textStyle: AppStyle
                                                        .caption12Medium,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              StoreAdditionalInformationRow(
                                                textStyle:
                                                    AppStyle.caption12Regular,
                                                distance: calculateDistance(
                                                  currentLatLng: LatLng(
                                                    storeList[index].latY,
                                                    storeList[index].lngX,
                                                  ),
                                                  targetLatLng: LatLng(
                                                    storeList[index].latY,
                                                    storeList[index].lngX,
                                                  ),
                                                ),
                                                recommendScore: storeList[index]
                                                        .recommendPercent
                                                        ?.toInt() ??
                                                    0,
                                                likeCount:
                                                    storeList[index].heartCnt,
                                                iconSize: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => context
                                              .read<StoreDetailBloc>()
                                              .add(
                                                StoreDetailNearStoreHeartRequested(
                                                  index: index,
                                                  isHeart:
                                                      !storeList[index].isHeart,
                                                ),
                                              ),
                                          child: storeList[index].isHeart
                                              ? loadAsset(
                                                  AppIcon.heartFill,
                                                  color: AppColor.orange500,
                                                )
                                              : loadAsset(
                                                  AppIcon.heartLine,
                                                  color: AppColor.grey300,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 12,
                        ),
                        itemCount: storeList.length,
                      ),
                    ),
                  ],
                );
              }
              return const CustomCircleLoadingIndicator();
            },
          ),
        ),
      ),
    );
  }
}
