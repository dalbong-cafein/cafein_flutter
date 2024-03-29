import 'dart:math';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/sticker/bloc/sticker_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyStickerCard extends StatelessWidget {
  const MyStickerCard({required this.isNotice , Key? key}) : super(key: key);
  final bool isNotice;
  @override
  Widget build(BuildContext context) {
    bool isBuild = false;

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
      buildWhen: (pre, next) => next is StickerLoaded && !isBuild,
      builder: (context, state) {
        if (state is StickerLoaded) {

          isBuild = true;
          return Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "모은 스티커",
                      style: AppStyle.subTitle17SemiBold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    state.stickerCnt.toString(),
                    style: AppStyle.subTitle17SemiBold
                        .copyWith(color: AppColor.orange500),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38, right: 38, top: 28, bottom: 24),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 36,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index + 1 <= state.stickerCnt) {
                        return loadAsset(
                            isNotice ? CafeinConst.randomStickers[index % CafeinConst.randomStickers.length] : CafeinConst.randomStickers[Random().nextInt(9)],
                            height: 60,
                            width: 60);
                      }
                      return Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColor.grey50,
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: AppColor.grey100),
                        ),
                        child: const Center(
                          child: Center(
                            child: Icon(Icons.question_mark_rounded,
                                color: AppColor.grey400),
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
