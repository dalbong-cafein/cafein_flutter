import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/home/widget/request_location_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/store_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:cafein_flutter/widget/chip/store_additional_information_row.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class RecommendStoresCard extends StatefulWidget {
  const RecommendStoresCard({Key? key}) : super(key: key);

  @override
  State<RecommendStoresCard> createState() => _RecommendStoresCardState();
}

class _RecommendStoresCardState extends State<RecommendStoresCard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        final state = context.read<LocationPermissionBloc>().state;

        context.read<HomeBloc>().add(
              HomeRecommendStoreRequested(
                isGranted: state is LocationPermissionChecked && state.permissionStatus.isGranted,
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      buildWhen: (pre, next) => next is HomeRecommendStoreLoaded,
      builder: (blocContext, state) {
        if (state is HomeRecommendStoreLoaded) {
          if (!state.isGranted) {
            return const RequestLocationCard();
          }

          if (state.recommendStores.isEmpty) {
            return const Text('빈화면');
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "근처에 있는 카공 카페를 찾아봤어요",
                  style: AppStyle.subTitle17SemiBold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 4),
                child: SizedBox(
                  width: width,
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (listContext, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            StoreDetailPage.routeName,
                            arguments: state.recommendStores[index].storeId,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                        3,
                                        (imageIndex) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          child: SizedBox(
                                            width: 70,
                                            height: 70,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: SizedBox.fromSize(
                                                size: const Size.fromRadius(48),
                                                child:
                                                    (state.recommendStores[index].imageIdPair ?? [])
                                                                    .length -
                                                                1 <
                                                            imageIndex
                                                        ? loadAsset(AppImage.noImage)
                                                        : Image.network(
                                                            state.recommendStores[index]
                                                                .imageIdPair![imageIndex].imageUrl,
                                                            fit: BoxFit.cover,
                                                          ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      state.recommendStores[index].storeName,
                                      style: AppStyle.subTitle15Medium,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8),
                                                  child: Row(
                                                    children: [
                                                      OpenCloseChip(
                                                        isOpen: state.recommendStores[index]
                                                                .businessInfo?.isOpen ??
                                                            false,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 4,
                                                        ),
                                                        child: ConfuseChip(
                                                          confuseScore: state.recommendStores[index]
                                                                      .congestionScoreAvg ==
                                                                  null
                                                              ? 1
                                                              : state.recommendStores[index]
                                                                  .congestionScoreAvg!,
                                                          height: 18,
                                                          textStyle: AppStyle.caption12Medium,
                                                          width: 29,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8),
                                                  child: StoreAdditionalInformationRow(
                                                    textStyle: AppStyle.caption12Regular,
                                                    distance: 150,
                                                    recommendScore: state
                                                            .recommendStores[index].recommendPercent
                                                            ?.toInt() ??
                                                        0,
                                                    likeCount:
                                                        state.recommendStores[index].heartCnt,
                                                    iconSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 72,
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () => context.read<HomeBloc>().add(
                                                    HomeStoreHeartRequested(
                                                      index: index,
                                                      isLike: !state.recommendStores[index].isHeart,
                                                    ),
                                                  ),
                                              child: state.recommendStores[index].isHeart
                                                  ? const Icon(
                                                      Icons.favorite_border_rounded,
                                                      color: AppColor.grey200,
                                                    )
                                                  : const Icon(
                                                      Icons.favorite_rounded,
                                                      color: Colors.orange,
                                                    ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
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
              )
            ],
          );
        }
        return const CustomCircleLoadingIndicator();
      },
    );
  }
}
