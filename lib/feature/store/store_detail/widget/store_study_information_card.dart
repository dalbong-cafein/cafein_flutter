import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/review/review_score_detail.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/util/review/get_review_string.dart';
import 'package:flutter/material.dart';

class StoreStudyInformationCard extends StatelessWidget {
  const StoreStudyInformationCard({
    super.key,
    required this.reviewDetailScore,
  });

  final ReviewDetailScore reviewDetailScore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 404,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '카공 정보',
                  style: AppStyle.subTitle17SemiBold,
                ),
                const Spacer(),
                loadAsset(
                  AppIcon.personS,
                  color: AppColor.grey400,
                ),
                const SizedBox(width: 4),
                Text(
                  '${reviewDetailScore.reviewCnt}명 참여',
                  style: AppStyle.caption13Regular.copyWith(
                    color: AppColor.grey400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 56,
              decoration: const BoxDecoration(
                color: AppColor.grey50,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loadAsset(
                    AppIcon.person,
                    color: AppColor.orange500,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '리뷰어 중 ',
                      style: AppStyle.subTitle14Medium.copyWith(
                        color: AppColor.grey800,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${reviewDetailScore.recommendPercent.round()}%',
                          style: AppStyle.subTitle15SemiBold.copyWith(
                            color: AppColor.orange500,
                          ),
                        ),
                        const TextSpan(
                          text: '가 카공 카페로 추천했어요.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _ReviewDetailRow(
              reviewCategory: ReviewCategory.socket,
              reviewScore: reviewDetailScore.socket,
              categoryReviewCount: reviewDetailScore.socketCnt,
              icon: AppIcon.socket,
            ),
            const SizedBox(height: 16),
            _ReviewDetailRow(
              reviewCategory: ReviewCategory.restroom,
              reviewScore: reviewDetailScore.restroom,
              categoryReviewCount: reviewDetailScore.reviewCnt,
              icon: AppIcon.restroom,
            ),
            const SizedBox(height: 16),
            _ReviewDetailRow(
              reviewCategory: ReviewCategory.table,
              reviewScore: reviewDetailScore.tableSize,
              categoryReviewCount: reviewDetailScore.tableCnt,
              icon: AppIcon.table,
            ),
            const SizedBox(height: 16),
            _ReviewDetailRow(
              reviewCategory: ReviewCategory.wifi,
              reviewScore: reviewDetailScore.wifi,
              categoryReviewCount: reviewDetailScore.wifiCnt,
              icon: AppIcon.wifi,
            ),
            const SizedBox(height: 12),
            Container(
              height: 24,
              width: 140,
              margin: const EdgeInsets.only(
                left: 56,
              ),
              decoration: const BoxDecoration(
                color: AppColor.grey50,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: const Center(
                child: Text(
                  '와이파이 비밀번호 보기',
                  style: AppStyle.caption12Regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewDetailRow extends StatelessWidget {
  const _ReviewDetailRow({
    required this.reviewCategory,
    required this.reviewScore,
    required this.categoryReviewCount,
    required this.icon,
  });

  final ReviewCategory reviewCategory;
  final String reviewScore;
  final int categoryReviewCount;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.grey50,
            radius: 20,
            child: loadAsset(icon),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reviewCategory.name,
                style: AppStyle.caption12Medium.copyWith(
                  color: AppColor.grey600,
                ),
              ),
              Text(
                getReviewString(
                  reviewCategory: reviewCategory,
                  reviewScore: reviewScore,
                ),
                style: AppStyle.subTitle15Medium,
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 24,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: AppColor.orange50,
            ),
            child: Center(
              child: Text(
                '$categoryReviewCount',
                style: AppStyle.subTitle15Medium.copyWith(
                  color: AppColor.orange500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
