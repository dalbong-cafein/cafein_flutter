import 'package:cafein_flutter/feature/sticker/bloc/sticker_bloc.dart';
import 'package:cafein_flutter/feature/sticker/widget/no_sticker_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StickerHistoryCard extends StatelessWidget {
  const StickerHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool isNewFirst = false;
    return BlocConsumer<StickerBloc, StickerState>(
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
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width / 2,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "스티커 히스토리",
                        style: AppStyle.subTitle17SemiBold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: InkWell(
                      onTap: () {
                        isNewFirst = !isNewFirst;
                        context.read<StickerBloc>().add(StickerReverseRequested(
                            stickers: state.stickers,
                            stickerCnt: state.stickerCnt,
                            couponCnt: state.couponCnt));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          loadAsset(
                            AppIcon.swapVert,
                            color : AppColor.grey500
                          ),
                          const SizedBox(width: 4),
                          Text(
                            isNewFirst ? "오래된 순" : "최근 순",
                            style: AppStyle.subTitle14Medium.copyWith(color: AppColor.grey600),
                          ),
                          const SizedBox(width: 20)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: state.stickers.isEmpty ? 1 : state.stickers.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      if (state.stickers.isEmpty) {
                        return const NoStickerCard();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1, color: AppColor.grey400),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  "+1",
                                  style: AppStyle.subTitle15Medium,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.stickers[index].stickerType,
                                  style: AppStyle.subTitle15Medium,
                                ),
                                Text(
                                  state.stickers[index].storeName,
                                  style:
                                      AppStyle.caption12Regular.copyWith(color: AppColor.grey400),
                                ),
                                Text(
                                  "유효기간 "
                                  "${state.stickers[index].registeredDateTime.substring(0, 10).replaceAll("-", ".")} - "
                                  "${state.stickers[index].expiredDateTime.substring(0, 10).replaceAll("-", ".")}",
                                  style: AppStyle.caption13Medium.copyWith(
                                      color: isExpire(state.stickers[index].expiredDateTime
                                              .substring(0, 10))
                                          ? AppColor.orange500
                                          : AppColor.grey800),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        }
        if (state is StickerLoading) {
          return const CustomCircleLoadingIndicator();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  bool isExpire(String day) {
    final year = int.parse(day.substring(0, 4));
    final month = int.parse(day.substring(5, 7));
    final date = int.parse(day.substring(8, 10));
    final dateTime = DateTime(year, month, date);
    final now = DateTime.now();
    if (dateTime.difference(now).inDays <= 7) {
      return true;
    } else {
      return false;
    }
  }
}
