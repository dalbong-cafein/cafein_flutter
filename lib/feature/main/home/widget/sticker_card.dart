import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/sticker/sticker_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StickerCard extends StatelessWidget {
  const StickerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;

    context.read<HomeBloc>().add(const HomeRequested());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(StickerPage.routeName);
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: (width - 32) * 0.8,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Center(
                          child: loadAsset(
                            AppImage.profile1,
                            width: 44 * widthPercent,
                            height: 44 * heightPercent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 4,
                          bottom: 4,
                        ),
                        child: BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (pre, next) => next is HomeLoaded,
                          builder: (context, state) {
                            if (state is HomeLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Text("내가 모은 스티커", style: AppStyle.subTitle15SemiBold),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          state.stickerCnt.toString(),
                                          style: AppStyle.subTitle15SemiBold.copyWith(
                                            color: AppColor.orange500,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        LinearPercentIndicator(
                                          padding: const EdgeInsets.all(0),
                                          animation: true,
                                          animationDuration: 2000,
                                          barRadius: const Radius.elliptical(20, 20),
                                          percent: state.stickerCnt / 20,
                                          lineHeight: 6 * heightPercent,
                                          width: 160 * widthPercent,
                                          backgroundColor: AppColor.orange50,
                                          progressColor: AppColor.orange400,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            "20개",
                                            style: AppStyle.caption12Regular
                                                .copyWith(color: AppColor.grey300),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }
                            return const CustomCircleLoadingIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: (width - 32) * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.grey400,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
