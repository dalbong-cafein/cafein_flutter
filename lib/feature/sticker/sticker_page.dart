
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';


class StickerPage extends StatelessWidget {
  const StickerPage({Key? key}) : super(key: key);



  static const routeName = 'StickerPage';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final widthPercent = width / 360;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "스티커",
          style: AppStyle.subTitle16Medium,
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.grey50,
                borderRadius: BorderRadius.all(
                    Radius.circular(14.0)
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width : 12
                    ),
                    loadAsset(
                        AppIcon.cokeSticker,
                        width: 32 * widthPercent
                    ),
                    const SizedBox(
                      width: 6
                    ),
                    const Text(
                        "스티커 받는 방법을 확인해 보세요",
                      style: AppStyle.body14Regular,
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}