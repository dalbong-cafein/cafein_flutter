import 'package:cafein_flutter/data/model/review/user_review.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisteredReviewCard extends StatelessWidget {
  const RegisteredReviewCard({
    Key? key,
    required this.review,
    required this.index,
  }) : super(key: key);

  final UserReview review;
  final int index;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserRepository>().getMemberData;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 36,
            child: Row(
              children: [
                CircleProfileImage(
                  imageUrl: userData?.imageIdPair?.imageUrl,
                  radius: 36,
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userData?.nickname ?? '',
                      style: AppStyle.subTitle14Medium,
                    ),
                    Text(
                      '${ymdDotFormatShort(review.registeredDateTime)} ${review.visitCnt}번째 방문',
                      style: AppStyle.caption12Regular.copyWith(
                        color: AppColor.grey400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 49,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('수정'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 24,
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('추천해요'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              review.content,
              style: AppStyle.body14Regular,
            ),
          ),
        ],
      ),
    );
  }
}
