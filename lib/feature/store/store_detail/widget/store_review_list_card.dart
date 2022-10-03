import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreReviewListCard extends StatelessWidget {
  const StoreReviewListCard({
    super.key,
    required this.reviews,
    required this.reviewCount,
  });

  final List<StoreReview> reviews;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    if (reviewCount == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            loadAsset(AppIcon.textBlank),
            const SizedBox(height: 16),
            Text(
              '작성된 리뷰가 없어요',
              style: AppStyle.caption13Regular.copyWith(
                color: AppColor.grey600,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: reviews.length * 196 + (reviews.length > 3 ? 60 : 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reviews.length > 3 ? 4 : reviews.length,
        itemBuilder: (context, index) {
          if (reviews.length > 3 && index == 3) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColor.grey100,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '리뷰 $reviewCount개 모두 보기',
                  ),
                ),
              ),
            );
          }
          return _ReviewCard(
            review: reviews[index],
          );
        },
      ),
    );
  }
}

class _ReviewCard extends StatefulWidget {
  const _ReviewCard({
    required this.review,
  });

  final StoreReview review;

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleProfileImage(
                imageUrl: widget.review.profileImageUrl,
                radius: 18,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.review.nicknameOfWriter,
                  ),
                  Text(
                    '${ymdDotFormatShort(widget.review.registeredDateTime)} ${widget.review.visitCnt}번째 방문',
                    style: AppStyle.caption12Regular.copyWith(
                      color: AppColor.grey400,
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.more_vert,
                color: AppColor.grey400,
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 24,
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.orange500,
                backgroundColor: AppColor.orange50,
                textStyle: AppStyle.caption13Regular,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              onPressed: () => setState(() => isExpanded = !isExpanded),
              child: const Text('추천해요'),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(
              top: 8,
            ),
            width: 200,
            height: isExpanded ? 40 : 0,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Row(
                  children: [
                    _ReviewDetailRow(
                      categoryTitle: ReviewCategory.wifi.name,
                      reviewScore: widget.review.detailEvaluation.wifi,
                    ),
                    _ReviewDetailRow(
                      categoryTitle: ReviewCategory.socket.name,
                      reviewScore: widget.review.detailEvaluation.socket,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _ReviewDetailRow(
                      categoryTitle: ReviewCategory.restroom.name,
                      reviewScore: widget.review.detailEvaluation.restroom,
                    ),
                    _ReviewDetailRow(
                      categoryTitle: ReviewCategory.table.name,
                      reviewScore: widget.review.detailEvaluation.tableSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if ((widget.review.imageIdPairs ?? []).isNotEmpty)
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, imageIndex) => ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: CustomCachedNetworkImage(
                    imageUrl: widget.review.imageIdPairs![imageIndex].imageUrl,
                    height: 72,
                    width: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: (widget.review.imageIdPairs ?? []).length,
              ),
            ),
        ],
      ),
    );
  }
}

class _ReviewDetailRow extends StatelessWidget {
  const _ReviewDetailRow({
    required this.categoryTitle,
    required this.reviewScore,
  });

  final String categoryTitle;
  final int reviewScore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Text(
            categoryTitle,
            style: AppStyle.caption12Regular,
          ),
          const SizedBox(width: 4),
          RatingBarIndicator(
            rating: reviewScore.toDouble(),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: AppColor.orange500,
            ),
            itemCount: 4,
            itemSize: 12,
            unratedColor: AppColor.grey200,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
