import 'package:cafein_flutter/feature/review/created_review/created_review_page.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_review_policy.dart';
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
        textAndStars("테이블", width),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            margin: const EdgeInsets.all(12),
            height: 120,
            child: TextField(
              buildCounter: (_, {required currentLength, maxLength, required isFocused}) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      currentLength.toString(),
                    style: AppStyle.caption12Medium.copyWith(
                      color : AppColor.blue
                    ),
                  ),
                  Text(
                      "/최대 $maxLength자",
                    style: AppStyle.caption12Medium.copyWith(
                      color : AppColor.grey400
                    ),
                  ),
                ],
              ),
              maxLines: 5,
              maxLength: 100,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppColor.grey400),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppColor.grey400),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: AppColor.white,
              hintText: "카페의 특별한 점이나 아쉬운 점을 최소 10글자 이상 남겨주세요(선택)",
              hintStyle: AppStyle.body14Regular.copyWith(
                color : AppColor.grey400
              ),
              filled: true,
              ),
            ),
          ),

        ),
        const CreatedReviewPolicy()
      ],
    );
  }

  Widget textAndStars(String text, double width) {
    String bottomText = " ";
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
                        if (text == "와이파이") {
                          if (rating == 1) {
                            bottomText = "없어요 그냥 없어요";
                          }
                          if (rating == 2) {
                            bottomText = "자주 끊겨서 화나요";
                          }
                          if (rating == 3) {
                            bottomText = "그냥저냥 쓸 만해요";
                          } else {
                            bottomText = "빵빵 잘 터져요";
                          }
                        }
                        if (text == "콘센트") {
                          if (rating == 1) {
                            bottomText = "바닥을 기어봐도 없어요";
                          }
                          if (rating == 2) {
                            bottomText = "찾기 힘들어요";
                          }
                          if (rating == 3) {
                            bottomText = "여유 있어요";
                          } else {
                            bottomText = "모든 자리에 있어요";
                          }
                        }
                        if (text == "화장실") {
                          if (rating == 1) {
                            bottomText = "없어요 그냥 없어요";
                          }
                          if (rating == 2) {
                            bottomText = "이용하기 꺼려져요";
                          }
                          if (rating == 3) {
                            bottomText = "그냥저냥 쓸만해요";
                          } else {
                            bottomText = "화장실 맛집이에요";
                          }
                        } else {
                          if (rating == 1) {
                            bottomText = "카공을 허락하지 않아요";
                          }
                          if (rating == 2) {
                            bottomText = "오래 쓰면 몸이 아파요";
                          }
                          if (rating == 3) {
                            bottomText = "그냥저냥 쓸만해요";
                          } else {
                            bottomText = "매우 편하게 사용 가능해요";
                          }
                        }
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
                bottomText,
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
