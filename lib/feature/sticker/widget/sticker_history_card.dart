import 'package:cafein_flutter/feature/sticker/widget/no_sticker_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StickerHistoryCard extends StatelessWidget {
  const StickerHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width : width  / 2,
              child: const Padding(
                padding: EdgeInsets.only(left : 20),
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
                    color : AppColor.grey500,
                    size: 16,
                  ),
                  const SizedBox(
                    width : 4
                  ),
                  Text(
                      "최근 순",
                    style: AppStyle.subTitle14Medium.copyWith(
                      color : AppColor.grey600
                    ),
                  ),
                  const SizedBox(
                    width:20
                  )
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top : 16),
          child: ListView.builder(
            itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (
                  BuildContext context,
                  int index
              ){
                return Padding(
                  padding: const EdgeInsets.only(top : 10, bottom: 10, left : 20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1,
                              color : AppColor.grey400
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
                        width : 12
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "혼잡도 공유",
                            style: AppStyle.subTitle15Medium,
                          ),
                          Text(
                            "투썸플레이스 명동성당",
                            style: AppStyle.caption12Regular.copyWith(
                              color : AppColor.grey400
                            ),
                          ),
                          const Text(
                            "유호기간 ~!!",
                            style: AppStyle.caption13Medium,
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
          ),
        ),

      ],
    );
  }
}
