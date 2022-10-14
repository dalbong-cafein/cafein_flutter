import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchEmptyStoreCard extends StatelessWidget {
  const SearchEmptyStoreCard({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  final String keyword;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              loadAsset(
                AppImage.noCafeQuestion,
                fit: BoxFit.scaleDown,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    keyword,
                    style: AppStyle.subTitle14Medium.copyWith(
                      color: AppColor.orange500,
                    ),
                  ),
                  Text(
                    "의 검색 결과가 없습니다.",
                    style: AppStyle.body14Regular.copyWith(
                      color: AppColor.grey800,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                margin: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: 36,
                ),
                width: width - 32,
                decoration: const BoxDecoration(
                  color: AppColor.green500,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "친구 초대하고\n무료 아메리카노 쿠폰 받자",
                      style: AppStyle.subTitle14Medium.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    const Spacer(),
                    loadAsset(
                      AppImage.adCoupon,
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
