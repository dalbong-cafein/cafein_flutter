import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/feature/review/created_review/bloc/created_review_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/util/review/get_review_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class RecommendStars extends StatelessWidget {
  const RecommendStars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "별점을 눌러 카페 정보를 자세히 알려주세요",
          style: AppStyle.subTitle14Medium.copyWith(
            color: AppColor.grey600,
          ),
        ),
        const SizedBox(height: 32),
        const _TextAndStars(
          reviewCategory: ReviewCategory.wifi,
          bottomText: '',
        ),
        const SizedBox(height: 12),
        const _TextAndStars(
          reviewCategory: ReviewCategory.socket,
          bottomText: '',
        ),
        const SizedBox(height: 12),
        const _TextAndStars(
          reviewCategory: ReviewCategory.restroom,
          bottomText: '',
        ),
        const SizedBox(height: 12),
        const _TextAndStars(
          reviewCategory: ReviewCategory.table,
          bottomText: '',
        ),
        const SizedBox(height: 36),
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          child: TextField(
            buildCounter: (
              _, {
              required currentLength,
              maxLength,
              required isFocused,
            }) =>
                Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  currentLength.toString(),
                  style: AppStyle.caption12Medium.copyWith(
                    color: AppColor.blue,
                  ),
                ),
                Text(
                  "/최대 $maxLength자",
                  style: AppStyle.caption12Medium.copyWith(
                    color: AppColor.grey400,
                  ),
                ),
              ],
            ),
            maxLines: 5,
            maxLength: 100,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColor.grey400,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColor.grey400,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: AppColor.white,
              hintText: "카페의 특별한 점이나 아쉬운 점을 최소 10글자 이상 남겨주세요(선택)",
              hintStyle: AppStyle.body14Regular.copyWith(
                color: AppColor.grey400,
              ),
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => context.read<CreatedReviewBloc>().add(
                const CreatedReviewPermissionRequested(
                  permission: Permission.photos,
                ),
              ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColor.grey300,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    loadAsset(
                      AppIcon.cameraL,
                      color: AppColor.grey400,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "0",
                          style: AppStyle.subTitle14Medium.copyWith(
                            color: AppColor.orange500,
                          ),
                        ),
                        Text(
                          "/5",
                          style: AppStyle.subTitle14Medium.copyWith(
                            color: AppColor.grey400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextAndStars extends StatelessWidget {
  const _TextAndStars({
    required this.reviewCategory,
    required this.bottomText,
  });

  final ReviewCategory reviewCategory;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 56,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 56,
                child: Text(
                  reviewCategory.name,
                  style: AppStyle.subTitle15SemiBold,
                ),
              ),
              const Spacer(),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 4,
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      itemBuilder: (context, _) => loadAsset(
                        AppIcon.starS,
                        color: AppColor.orange400,
                      ),
                      unratedColor: AppColor.grey200,
                      onRatingUpdate: (rating) {
                        final message = getReviewString(
                          reviewCategory: reviewCategory,
                          reviewScore: rating.toInt().toString(),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 175),
                child: Text(
                  bottomText,
                  style: AppStyle.caption12Regular.copyWith(
                    color: AppColor.grey600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
