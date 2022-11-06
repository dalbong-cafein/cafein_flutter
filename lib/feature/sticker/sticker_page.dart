import 'dart:math';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/apply_coupon/apply_coupon_page.dart';
import 'package:cafein_flutter/feature/received_coupons/received_coupons_page.dart';
import 'package:cafein_flutter/feature/sticker/bloc/sticker_bloc.dart';
import 'package:cafein_flutter/feature/sticker/widget/get_sticker_way_bottom_drawer.dart';
import 'package:cafein_flutter/feature/sticker/widget/mycoupon_card_button.dart';
import 'package:cafein_flutter/feature/sticker/widget/mystckier_card.dart';
import 'package:cafein_flutter/feature/sticker/widget/sticker_bottomsheet.dart';
import 'package:cafein_flutter/feature/sticker/widget/sticker_history_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StickerPage extends StatelessWidget {
  const StickerPage({Key? key}) : super(key: key);

  static const routeName = 'StickerPage';
  static const List<String> warningTexts = [
    "· 스티커 20개를 모으면 아메리카노 1잔 무료 쿠폰을 드립니다.",
    "· 무료 쿠폰은 프랜차이즈 카페 다섯 곳 중 한곳을 선택할 수 있습니다.",
    "· 발행된 기프티콘은 현금으로 환불할 수 없습니다.",
    "· 스탬프 유효 기간은 적립일 기준 6개월간입니다.",
    "· 하루에 최대 3개까지의 스티커를 받을 수 있습니다.",
    "· 한 카페에서 혼잡도를 공유해서 스탬프를 발행 받았을 시, 해당 카페에서 3시간 이내 재적립이 불가능합니다",
    "· 쿠폰은 신청일 이후 돌아오는 월요일에 일괄 발송합니다.",
    "· 신청한 쿠폰은 인증된 휴대폰번호로 발송됩니다."
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    context.read<StickerBloc>().add(const StickerRequested());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "스티커",
          style: AppStyle.subTitle16Medium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (modalContext) {
                      return const GetStickerWayBottomDrawer();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.grey50,
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          loadAsset(
                            CafeinConst.randomStickers[Random().nextInt(9)],
                            width: 32,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            "스티커 받는 방법을 확인해 보세요",
                            style: AppStyle.body14Regular,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const MyStickerCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(

                  decoration: const BoxDecoration(
                    color: AppColor.grey100,
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                  height: 1.0,),
            ),
            const SizedBox(
              height: 24,
            ),
            const StickerHistoryCard(),
            BlocConsumer<StickerBloc, StickerState>(
              buildWhen: (pre, next) => next is StickerLoaded,
              listener: (context, state) {
                if (state is StickerError) {
                  ErrorDialog.show(
                    context,
                    error: state.error,
                    refresh: state.event,
                  );
                }
              },
              builder: (context, state) {
                if (state is StickerLoaded) {
                  if (state.couponCnt >= 1) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(ReceivedCouponsPage.routeName);
                        },
                        child: const MyCouponCardButton());
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const CustomCircleLoadingIndicator();
                }
              },
            ),
            Container(
              width: width,
              color: AppColor.grey50,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        loadAsset(
                          AppIcon.reportXS
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "확인해 주세요",
                          style: AppStyle.subTitle15Medium.copyWith(
                            color: AppColor.grey600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: warningTexts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 3),
                            child: Text(
                              warningTexts[index],
                              style: AppStyle.caption13Regular.copyWith(
                                color: AppColor.grey500,
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: BlocConsumer<StickerBloc, StickerState>(
        listener: (context, state) {
          if (state is StickerError) {
            ErrorDialog.show(
              context,
              error: state.error,
              refresh: state.event,
            );
          }
        },
        builder: (context, state) {
          if (state is StickerLoaded) {
            if (state.stickerCnt >= 20) {
              return InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                  ApplyCouponPage.routeName,
                ),
                child: const StickerBottomSheet(),
              );
            } else {
              return const SizedBox.shrink();
            }
          }
          if (state is StickerLoading) {
            return const CustomCircleLoadingIndicator();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
