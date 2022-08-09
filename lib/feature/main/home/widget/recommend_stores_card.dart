import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendStoresCard extends StatelessWidget {
  const RecommendStoresCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    context.read<HomeBloc>().add(const HomeRecommendStoreRequested());
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
          return Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
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
                      itemBuilder: (BuildContext listContext, int index) {
                        int storeId = state.recommendStores[index].storeId;
                        return Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
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
                                                child: state.recommendStores[index].imageIdPair
                                                                .length -
                                                            1 <
                                                        imageIndex
                                                    ? loadAsset(AppImage.noImage)
                                                    : Image.network(
                                                        state.recommendStores[index]
                                                            .imageIdPair[imageIndex].imageUrl,
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
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color: state.recommendStores[index]
                                                                        .businessInfo?.isOpen ??
                                                                    false
                                                                ? AppColor.orange500
                                                                : AppColor.grey500,
                                                          ),
                                                          borderRadius: const BorderRadius.all(
                                                              Radius.circular(4.0)),
                                                        ),
                                                        child: Padding(
                                                            padding: const EdgeInsets.only(
                                                                top: 3,
                                                                bottom: 3,
                                                                left: 4,
                                                                right: 4),
                                                            child: state.recommendStores[index]
                                                                        .businessInfo?.isOpen ??
                                                                    false
                                                                ? Text(
                                                                    "영업중",
                                                                    style: AppStyle.caption11Regular
                                                                        .copyWith(
                                                                      color: AppColor.orange500,
                                                                    ),
                                                                  )
                                                                : Text(
                                                                    "영업종료",
                                                                    style: AppStyle.caption11Regular
                                                                        .copyWith(
                                                                      color: AppColor.grey500,
                                                                    ),
                                                                  )),
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
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.near_me_rounded,
                                                          color: AppColor.grey500, size: 16),
                                                      const Padding(
                                                        padding: EdgeInsets.only(left: 2),
                                                        child: Text(
                                                          "150m",
                                                          style: AppStyle.caption12Regular,
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.only(left: 4),
                                                        child: Icon(Icons.thumb_up_alt_rounded,
                                                            color: AppColor.orange400, size: 16),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 2),
                                                        child: Text(
                                                          state.recommendStores[index]
                                                                      .recommendPercent ==
                                                                  null
                                                              ? "0%"
                                                              : "${state.recommendStores[index].recommendPercent!.floor()}%",
                                                          style: AppStyle.caption12Regular,
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.only(left: 4),
                                                        child: Icon(Icons.favorite_rounded,
                                                            color: AppColor.orange400, size: 16),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 2),
                                                        child: Text(
                                                          state.recommendStores[index].heartCnt
                                                              .toString(),
                                                          style: AppStyle.caption12Regular,
                                                        ),
                                                      ),
                                                    ],
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
                                            BlocBuilder<HomeBloc, HomeState>(
                                              buildWhen: (pre, next) =>
                                                  next is HomeMyStoreCreateLoaded ||
                                                  next is HomeMyStoreDeleteLoaded ||
                                                  next is HomeRecommendStoreLoaded,
                                              builder: (context, heartState) {
                                                return InkWell(
                                                  child: state is! HomeMyStoreCreateLoaded
                                                      ? const Icon(Icons.favorite_border_rounded,
                                                          color: AppColor.grey200)
                                                      : const Icon(Icons.favorite_rounded,
                                                          color: Colors.orange),
                                                  onTap: () {
                                                    context.read<HomeBloc>().add(
                                                        HomeMyStoreCreateRequested(
                                                            storeId: storeId));
                                                  },
                                                );
                                              },
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
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const CircleLoadingIndicator();
      },
    );
  }
}
