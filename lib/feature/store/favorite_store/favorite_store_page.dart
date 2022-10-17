import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class FavoriteStorePage extends StatelessWidget {
  const FavoriteStorePage({Key? key}) : super(key: key);

  static const routeName = 'FavoriteStorePage';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "나의 카페",
          style: AppStyle.subTitle16Medium,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                    "총 12개",
                  style: AppStyle.subTitle14Medium.copyWith(color: AppColor.grey600),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){

                  },
                  child: Row(
                    children: [
                      Text(
                          "등록순",
                          style: AppStyle.caption13Medium.copyWith(color : AppColor.grey600)
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      loadAsset(
                          AppIcon.downXS,
                          color : AppColor.grey400,
                          height: 16,
                          width: 16
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container( height:1.0,
            width: width,
            color:AppColor.grey100,)

        ],
      ),
    );
  }
}
