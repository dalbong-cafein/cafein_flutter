import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/review/created_review/created_review_page.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreReviewRequestCard extends StatelessWidget {
  const StoreReviewRequestCard({
    super.key,
    required this.reviewCount,
    required this.storeDetail,
  });

  final int reviewCount;
  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              storeDetail.storeName,
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
                children: [
                  _ReviewIconCoulmn(
                    icon: AppImage.recBadGrey,
                    title: '아쉬워요',
                    storeDetail: storeDetail,
                    recommendation: ReviewRecommendation.bad,
                  ),
                  _ReviewIconCoulmn(
                    icon: AppImage.recNormalGrey,
                    storeDetail: storeDetail,
                    title: '무난해요',
                    recommendation: ReviewRecommendation.normal,
                  ),
                  _ReviewIconCoulmn(
                    icon: AppImage.recGoodGrey,
                    title: '추천해요',
                    storeDetail: storeDetail,
                    recommendation: ReviewRecommendation.good,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewIconCoulmn extends StatelessWidget {
  const _ReviewIconCoulmn({
    required this.icon,
    required this.title,
    required this.recommendation,
    required this.storeDetail,
  });

  final String icon;
  final String title;
  final ReviewRecommendation recommendation;
  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final bloc = context.read<StoreDetailBloc>();

        await Navigator.pushNamed(
          context,
          CreatedReviewPage.routeName,
          arguments: CreateReviewPageArguments(
            storeDetail: storeDetail,
            recommendation: recommendation,
          ),
        );

        bloc.add(const StoreDetailReviewRequested());
      },
      child: Column(
        children: [
          loadAsset(
            icon,
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
      ),
    );
  }
}
