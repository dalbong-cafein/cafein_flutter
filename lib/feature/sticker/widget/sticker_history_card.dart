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
        )
      ],
    );
  }
}
