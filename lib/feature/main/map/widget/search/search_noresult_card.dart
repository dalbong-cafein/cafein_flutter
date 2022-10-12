import 'package:cafein_flutter/feature/main/map/widget/search/search_popular_word_tab.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchNoResultCard extends StatelessWidget {
  const SearchNoResultCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColor.white,
          height: 417,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loadAsset(AppImage.noCafeQuestion, width: 52, height: 77),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "다봉쓰 ",
                    style: AppStyle.subTitle14Medium
                        .copyWith(color: AppColor.orange500),
                  ),
                  Text(
                    "의 검색 결과가 없습니다.",
                    style: AppStyle.body14Regular
                        .copyWith(color: AppColor.grey800),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          width: width - 32,
          color: AppColor.grey100,
        ),
        const SearchPopularWordTab(),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            width: width - 32,
            decoration: const BoxDecoration(
              color: AppColor.green500,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (width - 96) / 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Text(
                        "친구 초대하고\n무료 아메리카노 쿠폰 받자",
                        style: AppStyle.subTitle14Medium
                            .copyWith(color: AppColor.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (width - 96) / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        loadAsset(AppImage.adCoupon, width: 69, height: 60)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
