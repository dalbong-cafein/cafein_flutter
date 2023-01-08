import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/image_detail/image_detail_page.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/report/report_page.dart';
import 'package:cafein_flutter/feature/report/widget/report_bottom_sheet.dart';
import 'package:cafein_flutter/feature/review/store_review/bloc/store_review_bloc.dart';
import 'package:cafein_flutter/feature/review/store_review/store_review_list_page.dart';
import 'package:cafein_flutter/feature/review/updated_review/updated_review_page.dart';
import 'package:cafein_flutter/feature/review/widget/review_recommendation_button.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/dialog/login_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreReviewListCard extends StatelessWidget {
  const StoreReviewListCard({
    super.key,
    required this.reviews,
    required this.reviewCount,
    required this.storeDetail,
  });

  final List<StoreReview> reviews;
  final int reviewCount;
  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
    if (reviewCount == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 56),
        height: 186,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            loadAsset(AppIcon.textBlank),
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

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: reviewCount > 3 ? 4 : reviews.length,
      itemBuilder: (context, index) {
        if (reviewCount > 3 && index == 3) {
          return InkWell(
            onTap: () async {
              final bloc = context.read<StoreDetailBloc>();

              await Navigator.of(context).pushNamed(
                StoreReviewListPage.routeName,
                arguments: storeDetail,
              );

              bloc.add(const StoreDetailReviewRequested());
            },
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
          storeId: storeDetail.storeId,
          storeName: storeDetail.storeName,
          storeImageIdPair: storeDetail.storeImageList.firstOrNull,
        );
      },
    );
  }
}

class _ReviewCard extends StatefulWidget {
  const _ReviewCard({
    required this.review,
    required this.storeId,
    required this.storeName,
    this.storeImageIdPair,
  });

  final StoreReview review;
  final int storeId;
  final String storeName;
  final ImageIdPair? storeImageIdPair;

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
  bool isExpanded = false;
  late final userData = context.watch<UserRepository>().getMemberData;

  @override
  Widget build(BuildContext context) {

    final isAvailableEdit = DateTime.now()
            .difference(DateTime.parse(widget.review.registeredDateTime))
            .inDays <
        3;

    final isPreview = context.watch<AuthCubit>().state == const AuthPreviewed();

    final imageList =
        (widget.review.imageIdPairs ?? []).map((e) => e.imageUrl).toList();
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
                    widget.review.nicknameOfWriter.substring(
                      0,
                      (widget.review.nicknameOfWriter.length < 20)
                          ? widget.review.nicknameOfWriter.length
                          : 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                    context.read<StoreDetailBloc>().add(StoreDetailReviewReportClicked(reviewId: widget.review.reviewId));

                    final navigator = Navigator.of(context);

                    final isPreview = context.read<AuthCubit>().state ==
                        const AuthPreviewed();

                    final result = await ReportBottomSheet.show(context);

                    if (!result) {
                      return;
                    }

                    if (isPreview) {
                      // ignore: use_build_context_synchronously
                      final result = await LoginDialog.show(context);

                      if (!result) {
                        return;
                      }

                      return navigator.popUntil((route) => false);
                    }

                    navigator.pushNamed(
                      ReportPage.routeName,
                      arguments: widget.review.reviewId,
                    );
                  },
                  child: loadAsset(
                    AppIcon.optionVert,
                    color: AppColor.grey400,
                  ),
                )
              else
                isPreview
                    ? const SizedBox.shrink()
                    : (!isAvailableEdit
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 32,
                            width: 52,
                            child: ElevatedButton(
                              onPressed: () async {
                                final navigator = Navigator.of(context);
                                final bloc = context.read<StoreDetailBloc>();

                                final isPreview =
                                    context.read<AuthCubit>().state ==
                                        const AuthPreviewed();

                                if (isPreview) {
                                  final result =
                                      await LoginDialog.show(context);

                                  if (!result) {
                                    return;
                                  }

                                  return navigator.popUntil((route) => false);
                                }

                                await Navigator.of(context).pushNamed(
                                  UpdatedReviewPage.routeName,
                                  arguments: UpdateReviewPageArgument(
                                    storeId: widget.storeId,
                                    storeName: widget.storeName,
                                    review: widget.review,
                                    storeImageIdPair: widget.storeImageIdPair,
                                  ),
                                );

                                bloc.add(const StoreDetailReviewRequested());
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
                          )),
            ],
          ),
          const SizedBox(height: 12),
          ReviewRecommendationButton(
            reviewRecommendation: ReviewRecommendation.values
                .where(
                  (element) =>
                      element.jsonValue == widget.review.recommendation,
                )
                .first,
            onPressed: () => setState(() => isExpanded = !isExpanded),
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
          const SizedBox(height: 12),
          if ((widget.review.imageIdPairs ?? []).isNotEmpty)
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, imageIndex) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ImageDetailPage.routeName,
                      arguments: ImageDetailPageArguments(
                        initialPage: imageIndex,
                        imageUrls: imageList,
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: CustomCachedNetworkImage(
                      key: ValueKey(
                        widget.review.imageIdPairs![imageIndex].imageUrl,
                      ),
                      imageUrl:
                          widget.review.imageIdPairs![imageIndex].imageUrl,
                      height: 72,
                      width: 72,
                      fit: BoxFit.cover,
                    ),
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
