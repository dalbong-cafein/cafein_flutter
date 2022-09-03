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
        textAndStars("와이파이",  width),
        const SizedBox(
          height: 30,
        ),
        textAndStars("콘센트",  width),
        const SizedBox(
          height: 30,
        ),
        textAndStars("화장실",  width),
        const SizedBox(
          height: 30,
        ),
        textAndStars("테이블",  width)
      ],
    );
  }

  Widget textAndStars(String text, double width){
    return Row(
      children: [
        SizedBox(
          width : width  * 0.3,
          child: Padding(
            padding: const EdgeInsets.only(left : 56),
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
                padding: const EdgeInsets.only(right : 56),
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 4,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star_rounded,
                    color: AppColor.orange400,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
