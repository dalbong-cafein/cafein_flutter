import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecommendStars extends StatelessWidget {
  const RecommendStars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "별점을 눌러 카페 정보를 자세히 알려주세요",
          style: AppStyle.subTitle14Medium.copyWith(color: AppColor.grey600),
        ),
        const SizedBox(
          height: 32,
        ),
        textAndStars("와이파이", width),
        const SizedBox(
          height: 10,
        ),
        textAndStars("콘센트", width),
        const SizedBox(
          height: 10,
        ),
        textAndStars("화장실", width),
        const SizedBox(
          height: 10,
        ),
        textAndStars("테이블", width)
      ],
    );
  }

  Widget textAndStars(String text, double width) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: width * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  text,
                  style: AppStyle.subTitle15SemiBold,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 4,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rounded,
                        color: AppColor.orange400,
                      ),
                      unratedColor: AppColor.grey200,
                      onRatingUpdate: (rating) {

                      },
                    ),
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
                "여유 있어요",
                style:
                    AppStyle.caption12Regular.copyWith(color: AppColor.grey600),
              ),
            ),
          ],
        )
      ],
    );
  }
}
