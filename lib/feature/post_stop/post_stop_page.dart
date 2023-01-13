import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/report_detail_card.dart';
import 'widget/report_policy_card.dart';

class PostStopPage extends StatelessWidget {
  const PostStopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
            height: 24,
            width: 24,
            child: loadAsset(AppIcon.clearXS, height: 24, width: 24)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "작성한 리뷰에 대해\n신고가 접수되어 안내드립니다.",
                style: AppStyle.title25Bold.copyWith(color: AppColor.grey900),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "안녕하세요. 카페인팀입니다.\n항상 카페인을 이용해 주시고 많은 관심 가져주셔서\n진심으로 감사드립니다.",
                style: AppStyle.body15Regular
                    .copyWith(color: AppColor.grey800, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "회원님께서 작성하신 리뷰에 대해 신고가 접수되어",
                style: AppStyle.body15Regular
                    .copyWith(color: AppColor.grey800, height: 1.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "게시물이",
                    style: AppStyle.body15Regular
                        .copyWith(color: AppColor.grey800, height: 1.5),
                  ),
                  Text(
                    " 게시중단(임시조치) ",
                    style: AppStyle.body15Regular
                        .copyWith(color: AppColor.orange500, height: 1.5),
                  ),
                  Text(
                    "처리되었습니다.",
                    style: AppStyle.body15Regular
                        .copyWith(color: AppColor.grey800, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const ReportDetailCard(),
            const SizedBox(
              height: 24,
            ),
            const ReportPolicyCard(),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "게시중단 후 30일 이내 이의 신청이 가능하며,\n이의 신청이 접수되지 않은 경우 30일 이후 게시물은 영구 삭제됩니다.\n상세한 내용은 회원님의 회원정보에 기재된 이메일로 안내 드렸습니다.",
                style: AppStyle.body15Regular.copyWith(color: AppColor.grey800, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left : 16),
              child: InkWell(
                onTap: (){
                  //1:1 문의하기
                },
                child: Container(
                  width: width - 32,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color : AppColor.grey400
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(16)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Center(child: Text("이의 신청하기" , style: AppStyle.subTitle15Medium.copyWith(color : AppColor.grey800),)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left : 16, top : 12),
              child: InkWell(
                onTap: (){
                  //확인
                },
                child: Container(
                  width: width - 32,
                  decoration: const BoxDecoration(
                    color : AppColor.orange400,
                    borderRadius: BorderRadius.all(
                        Radius.circular(16)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: Text("확인" , style: AppStyle.subTitle15Medium.copyWith(color : AppColor.white),)),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
