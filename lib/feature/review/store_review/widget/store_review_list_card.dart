import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/report/report_page.dart';
import 'package:cafein_flutter/feature/report/widget/report_bottom_sheet.dart';
import 'package:cafein_flutter/feature/review/store_review/bloc/store_review_bloc.dart';
import 'package:cafein_flutter/feature/review/updated_review/updated_review_page.dart';
import 'package:cafein_flutter/feature/review/widget/review_recommendation_button.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreReviewListCard extends StatefulWidget {
  const StoreReviewListCard({
    Key? key,
    required this.review,
    required this.index,
  }) : super(key: key);

  final StoreReview review;
  final int index;

  @override
  State<StoreReviewListCard> createState() => _StoreReviewListCardState();
}

class _StoreReviewListCardState extends State<StoreReviewListCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserRepository>().getMemberData;
    final isAvailableEdit = DateTime.now()
            .difference(DateTime.parse(widget.review.registeredDateTime))
            .inDays <
        3;

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
                imageUrl: userData?.imageIdPair?.imageUrl,
                radius: 18,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData?.nickname ?? '',
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
              if (widget.review.writerId != userData?.memberId)
                InkWell(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    final result = await ReportBottomSheet.show(context);

                    if (!result) {
                      return;
                    }

                    navigator.pushNamed(
                      ReportPage.routeName,
                    );
                  },
                  child: loadAsset(
                    AppIcon.optionVert,
                    color: AppColor.grey400,
                  ),
                )
              else
                !isAvailableEdit
                    ? const SizedBox.shrink()
                    : SizedBox(
                        height: 32,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () async {
                            final bloc = context.read<StoreReviewBloc>();

                            final result =
                                await Navigator.of(context).pushNamed(
                              UpdatedReviewPage.routeName,
                              arguments: widget.review,
                            );

                            if (result is! bool) {
                              return;
                            }

                            if (!result) {
                              return;
                            }

                            bloc.add(const StoreReviewRequested());
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.grey800,
                            backgroundColor: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            textStyle: AppStyle.subTitle15Medium,
                            side: const BorderSide(
                              color: AppColor.grey400,
                              width: 1,
                            ),
                          ),
                          child: const Text('수정'),
                        ),
                      ),
            ],
          ),
          const SizedBox(height: 12),
          ReviewRecommendationButton(
            reviewRecommendation: ReviewRecommendation.values
                .where((element) =>
                    element.jsonValue == widget.review.recommendation)
                .first,
            onPressed: () => setState(
              () => isExpanded = !isExpanded,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(
              top: 8,
            ),
            width: 224,
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
                    const SizedBox(width: 8),
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
                      categoryTitle: '${ReviewCategory.restroom.name} ',
                      reviewScore: widget.review.detailEvaluation.restroom,
                    ),
                    const SizedBox(width: 8),
                    _ReviewDetailRow(
                      categoryTitle: ReviewCategory.table.name,
                      reviewScore: widget.review.detailEvaluation.tableSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.review.content ?? '',
              style: AppStyle.body14Regular,
            ),
          ),
          if ((widget.review.imageIdPairs ?? []).isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                height: 72,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, imageIndex) => ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: CustomCachedNetworkImage(
                      imageUrl:
                          widget.review.imageIdPairs![imageIndex].imageUrl,
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
    return Row(
      children: [
        SizedBox(
          width: categoryTitle.length == 4 ? 42 : 34,
          child: Text(
            categoryTitle,
            style: AppStyle.caption12Regular,
          ),
        ),
        const SizedBox(width: 4),
        RatingBarIndicator(
          rating: reviewScore.toDouble(),
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColor.orange500,
          ),
          itemCount: 5,
          itemSize: 12,
          unratedColor: AppColor.grey200,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
