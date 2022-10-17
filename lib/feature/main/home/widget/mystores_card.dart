import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyStoresCard extends StatelessWidget {
  const MyStoresCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is HomeLoaded,
        builder: (context, state) {
          if (state is HomeLoaded) {
            if (state.memberStores.isEmpty) {
              return Container(
                width: width - 32,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 31, bottom: 31),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loadAsset(
                        AppImage.noCafe,
                        height: 42,
                        width: 32,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("등록된 나의 카페가 없어요"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("카페의 하트를 눌러 나의 카페로 등록해 보세요"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.orange500,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 10,
                              bottom: 10,
                            ),
                            child: InkWell(
                              onTap: () => context.read<MainBloc>().add(
                                    const MainTabChanged(index: 1),
                                  ),
                              child: Text(
                                "카페 찾아보기",
                                style: AppStyle.subTitle14Medium.copyWith(
                                  color: AppColor.orange500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "나의 카페",
                      style: AppStyle.subTitle17SemiBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.memberStores.length >= 4
                            ? 4
                            : state.memberStores.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 20,
                            ),
                            child: SizedBox(
                              width: (width - 64) * 0.8,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48),
                                        child: state.memberStores[index]
                                                    .imageIdPair ==
                                                null
                                            ? const CustomCachedNetworkImage(
                                                imageUrl: CafeinConst
                                                    .defaultStoreImage,
                                                height: 48,
                                                width: 48,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                state.memberStores[index]
                                                    .imageIdPair!.imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.memberStores[index].storeName,
                                          style: AppStyle.subTitle15Medium,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              OpenCloseChip(
                                                isOpen: state
                                                        .memberStores[index]
                                                        .businessInfo
                                                        ?.isOpen ??
                                                    false,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6.0),
                                                child: Text(
                                                  state
                                                              .memberStores[
                                                                  index]
                                                              .businessInfo
                                                              ?.isOpen ??
                                                          false
                                                      ? "${_parseTime(state.memberStores[index].businessInfo?.closed ?? "null")}에 영업 종료"
                                                      : "${_parseTime(state.memberStores[index].businessInfo?.tmrOpen ?? "null")}에 영업 시작",
                                                  style: AppStyle
                                                      .caption12Regular
                                                      .copyWith(
                                                          color:
                                                              AppColor.grey600),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  ConfuseChip(
                                    confuseScore: state
                                        .memberStores[index].congestionScoreAvg,
                                    height: 24,
                                    textStyle: AppStyle.subTitle15Medium,
                                    width: 42,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  state.memberStores.length <= 4
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Container(
                              height: 1.0,
                              width: width - 32,
                              color: AppColor.grey100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "나의 카페${state.memberStores.length}개 모두 보기",
                                    style: AppStyle.body14Regular,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: loadAsset(AppIcon.rightS,
                                          color: AppColor.grey400))
                                ],
                              ),
                            )
                          ],
                        ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
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
        return "오후0$hour:$minute";
      }
      return "오후$hour:$minute";
    } else {
      if (hour <= 9) {
        return "오전0$hour:$minute";
      }
      return "오전$hour:$minute";
    }
  }
}
