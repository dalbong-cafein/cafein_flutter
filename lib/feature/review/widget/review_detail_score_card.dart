import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/util/review/get_review_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewDetailScoreCard extends StatefulWidget {
  const ReviewDetailScoreCard({
    Key? key,
    required this.wifiScore,
    required this.restroomScore,
    required this.socketScore,
    required this.tableScore,
    required this.textControllerListener,
    required this.onRatingChanged,
    this.initialRestroomScore,
    this.initialSocketScore,
    this.initialTableScore,
    this.initialWifiScore,
    this.initialText,
  }) : super(key: key);

  final String wifiScore;
  final String restroomScore;
  final String socketScore;
  final String tableScore;

  final String? initialWifiScore;
  final String? initialRestroomScore;
  final String? initialSocketScore;
  final String? initialTableScore;
  final String? initialText;

  final void Function(String text) textControllerListener;
  final void Function(
    ReviewCategory reviewCategory,
    String score,
  ) onRatingChanged;

  @override
  State<ReviewDetailScoreCard> createState() => _ReviewDetailScoreCardState();
}

class _ReviewDetailScoreCardState extends State<ReviewDetailScoreCard> {
  late final controller = TextEditingController(
    text: widget.initialText,
  );

  @override
  void initState() {
    super.initState();
    controller.addListener(
      () => widget.textControllerListener(controller.text),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        _TextAndStars(
          reviewCategory: ReviewCategory.wifi,
          score: widget.wifiScore,
          onRatingChanged: widget.onRatingChanged,
          initialScore: widget.initialWifiScore,
        ),
        const SizedBox(height: 12),
        _TextAndStars(
          reviewCategory: ReviewCategory.socket,
          score: widget.socketScore,
          onRatingChanged: widget.onRatingChanged,
          initialScore: widget.initialSocketScore,
        ),
        const SizedBox(height: 12),
        _TextAndStars(
          reviewCategory: ReviewCategory.restroom,
          score: widget.restroomScore,
          onRatingChanged: widget.onRatingChanged,
          initialScore: widget.initialRestroomScore,
        ),
        const SizedBox(height: 12),
        _TextAndStars(
          reviewCategory: ReviewCategory.table,
          score: widget.tableScore,
          onRatingChanged: widget.onRatingChanged,
          initialScore: widget.initialTableScore,
        ),
        const SizedBox(height: 36),
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          child: TextField(
            controller: controller,
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
      ],
    );
  }
}

class _TextAndStars extends StatelessWidget {
  const _TextAndStars({
    required this.reviewCategory,
    required this.score,
    required this.onRatingChanged,
    this.initialScore,
  });

  final ReviewCategory reviewCategory;
  final String score;
  final String? initialScore;
  final void Function(
    ReviewCategory reviewCategory,
    String score,
  ) onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              width: 56,
              child: Text(
                reviewCategory.name,
                style: AppStyle.subTitle15SemiBold,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 56,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RatingBar.builder(
                      initialRating: initialScore == null
                          ? 0
                          : int.parse(initialScore!).toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      glow: false,
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      itemBuilder: (context, _) => loadAsset(
                        AppIcon.starS,
                        color: AppColor.orange400,
                      ),
                      unratedColor: AppColor.grey200,
                      onRatingUpdate: (rating) => onRatingChanged(
                        reviewCategory,
                        rating.toInt().toString(),
                      ),
                    ),
                  ],
                ),
                if (score.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      getReviewString(
                        reviewCategory: reviewCategory,
                        reviewScore: score,
                      ),
                      style: AppStyle.caption12Regular.copyWith(
                        color: AppColor.grey600,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
