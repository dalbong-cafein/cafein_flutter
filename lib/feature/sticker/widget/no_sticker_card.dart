import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';

class NoStickerCard extends StatelessWidget {
  const NoStickerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loadAsset(AppImage.noCafe , width : 38 , height: 42),
          const SizedBox(
            height: 10,
          ),
          Text(
            "모은 스티커가 없어요",
            style: AppStyle.caption13Regular.copyWith(
              color : AppColor.grey600
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "스티커를 20개 모으면 아메리카노 쿠폰을 드려요",
            style: AppStyle.caption13Regular.copyWith(
                color : AppColor.grey600
            ),
          )
        ],
      ),
    );
  }
}
