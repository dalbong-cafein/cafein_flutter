import 'package:cafein_flutter/feature/image_detail/image_detail_page.dart';
import 'package:cafein_flutter/feature/post_stop/widget/reported_review_detail_score_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReportedReviewDetailCard extends StatelessWidget {
  const ReportedReviewDetailCard({Key? key, required noticeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left : 20),
          child: Text("신고 사유", style: AppStyle.subTitle15Bold,),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left : 20),
          child: Text("카페와 관련 없는 내용", style: AppStyle.body15Regular.copyWith(color : AppColor.grey900),),
        ),
        const SizedBox(
          height: 24,
        ),
        Center(
          child: Container(
            height: 1.0,
            width: width - 40,
            color: AppColor.grey100,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.only(left : 20),
          child: Text("신고 대상 게시물", style: AppStyle.subTitle15Bold,),
        ),
        const SizedBox(
          height: 16,
        ),

        Padding(
          padding: const EdgeInsets.only(left : 16),
          child: const ReportedReviewDetailScoreCard(),
        ),
        const SizedBox(
          height: 12,
        ),
        ///////TODO : 여기에 리뷰 정보 넣기, true -> 이미지 존재 여부
        true? Padding(
          padding: const EdgeInsets.only(left : 16),
          child: SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, imageIndex) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ImageDetailPage.routeName,
                    arguments: ImageDetailPageArguments(
                      initialPage: imageIndex,
                      imageUrls: ["https://avatars.githubusercontent.com/u/73538957?v=4", "https://avatars.githubusercontent.com/u/73538957?v=4"],
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: CustomCachedNetworkImage(
                    key: ValueKey(
                      "https://avatars.githubusercontent.com/u/73538957?v=4",

                    ),
                    imageUrl:
                    "https://avatars.githubusercontent.com/u/73538957?v=4",
                    height: 74,
                    width: 74,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemCount: (["https://avatars.githubusercontent.com/u/73538957?v=4", "https://avatars.githubusercontent.com/u/73538957?v=4"]).length,
            ),
          ),
        ) : const SizedBox.shrink(),

        const SizedBox(
          height: 24,
        ),
        Center(
          child: Container(
            height: 1.0,
            width: width - 40,
            color: AppColor.grey100,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.only(left : 20),
          child: Text("게시 중단 일자", style: AppStyle.subTitle15Bold,),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left : 20),
          child: Text("2022.12.17", style: AppStyle.body15Regular.copyWith(color : AppColor.grey900),),
        ),




      ],
    );
  }
}





