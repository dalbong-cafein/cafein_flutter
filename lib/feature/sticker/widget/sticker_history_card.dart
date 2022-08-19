import 'package:cafein_flutter/feature/sticker/bloc/sticker_bloc.dart';
import 'package:cafein_flutter/feature/sticker/widget/no_sticker_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StickerHistoryCard extends StatelessWidget {
  const StickerHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.swap_vert,
                    color: AppColor.grey500,
                    size: 16,
                  ),
                  const SizedBox(
                      width: 4
                  ),
                  Text(
                    "최근 순",
                    style: AppStyle.subTitle14Medium.copyWith(
                        color: AppColor.grey600
                    ),
                  ),
                  const SizedBox(
                      width: 20
                  )
                ],
              ),
            )
          ],
        ),

        BlocConsumer<StickerBloc, StickerState>(
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
            if(state is StickerLoaded){
              if(state.stickerCnt == 0){
                return const NoStickerCard();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: state.stickerCnt,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,
                        int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1,
                                    color: AppColor.grey400
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  "+1",
                                  style: AppStyle.subTitle15Medium,
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 12
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.stickers[index].stickerType,
                                  style: AppStyle.subTitle15Medium,
                                ),
                                Text(
                                  state.stickers[index].storeName,
                                  style: AppStyle.caption12Regular.copyWith(
                                      color: AppColor.grey400
                                  ),
                                ),
                                Text(
                                  "유효기간 "
                                      "${state.stickers[index].registeredDateTime.substring(0, 10).replaceAll("-", ".")} - "
                                      "${state.stickers[index].expiredDateTime.substring(0, 10).replaceAll("-", ".")}",
                                  style: AppStyle.caption13Medium,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                ),
              );
            }else{
              return const CircleLoadingIndicator();
            }

          },
        ),

      ],
    );
  }
}
