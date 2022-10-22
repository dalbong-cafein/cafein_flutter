import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favorite_store_bloc.dart';

class FavoriteStorePage extends StatelessWidget {
  const FavoriteStorePage({Key? key}) : super(key: key);

  static const routeName = 'FavoriteStorePage';

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteStoreBloc>().add(
          const FavoriteStoreRequested(),
        );
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "나의 카페",
          style: AppStyle.subTitle16Medium,
        ),
      ),
      body: BlocConsumer<FavoriteStoreBloc, FavoriteStoreState>(
        buildWhen: (pre, next) => next is FavoriteStoreLoaded,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FavoriteStoreLoaded) {
            return Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "총 12개",
                        style: AppStyle.subTitle14Medium
                            .copyWith(color: AppColor.grey600),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("등록순",
                                style: AppStyle.caption13Medium
                                    .copyWith(color: AppColor.grey600)),
                            const SizedBox(
                              width: 4,
                            ),
                            loadAsset(AppIcon.downXS,
                                color: AppColor.grey400, height: 16, width: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  height: 1.0,
                  width: width,
                  color: AppColor.grey100,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.storeCount,
                    itemBuilder: (BuildContext context, int index) {
                      return favoriteStoreItem(
                          state.stores[index].storeName,
                          state.stores[index].businessInfo?.isOpen ?? false,
                          state.stores[index].businessInfo?.tmrOpen ?? "00:00",
                          state.stores[index].businessInfo?.closed ?? "00:00",
                          state.stores[index].congestionScoreAvg ?? 0,
                          state.stores[index].storeId,
                        context
                      );
                    })
              ],
            );
          } else {
            return const CustomCircleLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget favoriteStoreItem(String storeName, bool isOpen, String openTime,
      String closeTime, double storeConfuse , int storeId, BuildContext context) {
    bool heartOn;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20, top: 8, bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.fromSize(
                  size: const Size.fromRadius(48),
                  child: const CustomCachedNetworkImage(
                    imageUrl: CafeinConst.defaultStoreImage,
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: AppStyle.subTitle15Medium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    OpenCloseChip(isOpen: isOpen),
                    const SizedBox(
                      width: 4,
                    ),
                    isOpen
                        ? ConfuseChip(
                            width: 29,
                            height: 18,
                            textStyle: AppStyle.caption12Medium,
                            confuseScore: storeConfuse,
                          )
                        : const SizedBox.shrink(),
                    isOpen
                        ? const SizedBox(
                            width: 6,
                          )
                        : const SizedBox.shrink(),
                    Text(
                      isOpen
                          ? "${_parseTime(closeTime)}에 영업 종료"
                          : "${_parseTime(openTime)}에 영업 시작",
                      style: AppStyle.caption12Regular
                          .copyWith(color: AppColor.grey600),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){

              context.read<FavoriteStoreBloc>().add(
                FavoriteStoreClicked(clickedStoreId: storeId),
              );
            },
              child: loadAsset(AppIcon.heartOn ,
                  height: 24, width: 24))
        ],
      ),
    );
  }

  String _parseTime(String time) {
    int hour = int.parse(time.substring(0, 2));
    String minute = time.substring(3, 5);
    if (time == "null") {
      return "시간 정보가 없습니다";
    } else if (hour > 12) {
      hour = hour - 12;
      if (hour <= 9) {
        return "오후 0$hour:$minute";
      }
      return "오후 $hour:$minute";
    } else {
      if (hour <= 9) {
        return "오전 0$hour:$minute";
      }
      return "오전 $hour:$minute";
    }
  }
}
