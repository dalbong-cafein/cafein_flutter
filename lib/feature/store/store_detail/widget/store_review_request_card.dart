import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class StoreReviewRequestCard extends StatelessWidget {
  const StoreReviewRequestCard({
    super.key,
    required this.reviewCount,
    required this.storeName,
  });

  final int reviewCount;
  final String storeName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          //TODO: 리뷰 작성 페이지 이동
        },
        child: SizedBox(
          height: 240,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: '리뷰 ',
                      style: AppStyle.subTitle17SemiBold.copyWith(
                        color: AppColor.grey800,
                      ),
                      children: [
                        TextSpan(
                          text: '$reviewCount',
                          style: AppStyle.subTitle17SemiBold.copyWith(
                            color: AppColor.orange500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  storeName,
                  style: AppStyle.subTitle15Medium.copyWith(
                    color: AppColor.orange500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '카공 카페로 어떤가요?',
                  style: AppStyle.body14Regular,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ReviewIconCoulmn(
                        icon: AppImage.recBadGrey,
                        title: '별로에요',
                      ),
                      _ReviewIconCoulmn(
                        icon: AppImage.recNormalGrey,
                        title: '그저그래요',
                      ),
                      _ReviewIconCoulmn(
                        icon: AppImage.recGoodGrey,
                        title: '추천해요',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewIconCoulmn extends StatelessWidget {
  const _ReviewIconCoulmn({
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loadAsset(
          AppImage.recBadGrey,
          width: 56,
          height: 56,
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: AppStyle.caption13Medium.copyWith(
            color: AppColor.grey400,
          ),
        ),
      ],
    );
  }
}
