import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class ReviewRecommendationButton extends StatelessWidget {
  const ReviewRecommendationButton({
    Key? key,
    required this.reviewRecommendation,
    required this.onPressed,
  }) : super(key: key);

  final ReviewRecommendation reviewRecommendation;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    late final Color foregroundColor;
    late final Color backgroundColor;

    switch (reviewRecommendation) {
      case ReviewRecommendation.normal:
        foregroundColor = AppColor.amber500;
        backgroundColor = AppColor.amber50;
        break;
      case ReviewRecommendation.good:
        foregroundColor = AppColor.orange500;
        backgroundColor = AppColor.orange50;
        break;
      case ReviewRecommendation.bad:
        foregroundColor = AppColor.grey600;
        backgroundColor = AppColor.grey200;
        break;
    }

    return SizedBox(
      height: 24,
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          textStyle: AppStyle.caption13Regular,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              reviewRecommendation.buttonTitle,
            ),
            loadAsset(
              AppIcon.downXS,
              color: foregroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
