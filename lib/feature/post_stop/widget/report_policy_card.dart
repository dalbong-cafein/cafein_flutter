import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPolicyCard extends StatefulWidget {
  const ReportPolicyCard({Key? key}) : super(key: key);

  @override
  _ReportPolicyCardState createState() => _ReportPolicyCardState();
}

class _ReportPolicyCardState extends State<ReportPolicyCard> {
  bool isToggleClicked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              isToggleClicked = !isToggleClicked;
            });
          },
          child: Column(
            children: [
              Container(
                height: 1.0,
                width: width - 40,
                color: AppColor.grey100,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "신고 정책 확인하기",
                    style:
                    AppStyle.subTitle15Medium.copyWith(color: AppColor.grey800),
                  ),
                  const Spacer(),
                  loadAsset(isToggleClicked ? AppIcon.upXS : AppIcon.downXS,
                      height: 16, width: 16),
                  const SizedBox(width: 20)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        isToggleClicked
            ? Container(
                width: width - 32,
                decoration: const BoxDecoration(
                  color: AppColor.grey50,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _reportPolicyText(
                          "신고를 받으면 총 5단계를 통해 서비스 이용이 정지돼요.\n[신고 1회]\n경고 메시지를 통지한 후 신고 정책에 대한 안내를 제공해요.\n[신고 2회]\n하루 동안 카페 등록, 카페 리뷰 작성, 혼잡도 공유 등이 정지돼요.\n[신고 3회]\n삼 일간 카페 등록, 카페 리뷰 작성, 혼잡도 공유 등이 정지돼요.\n[신고 4회]\n일주일간 카페 등록, 카페 리뷰 작성, 혼잡도 공유 등이 정지돼요.\n[신고 5회]\n한 달간 카페 등록, 카페 리뷰 작성, 혼잡도 공유 등이 정지돼요."),
                      const SizedBox(
                        height: 20,
                      ),
                      _reportPolicyText("아래와 같은 행동은 신고 사유에 포함되고 있으니 리뷰 작성에 주의해 주세요.\n1. 카페와 관련 없는 내용\n2. 음란성, 욕설 등 부적절한 내용\n3. 부적절한 홍보 또는 광고\n4. 개인정보 유출 위험\n5. 리뷰 작성 취지에 맞지 않는 내용 (복사 글 등)\n6. 저작권 도용 의심")
                      ,const SizedBox(
                        height: 20,
                      ),
                      _reportPolicyText("*항목에 따라 사전 안내 없이 이용이 영구 제한될 수 있어요.\n내가 받은 신고가 적절하지 않다고 생각되는 경우,\n[더보기 > 자주 묻는 질문 > 1:1 문의하기]로 접수해 주세요.")
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
        isToggleClicked ? const SizedBox(
          height: 16,
        ) : const SizedBox.shrink(),
        Container(
          height: 1.0,
          width: width - 40,
          color: AppColor.grey100,
        ),
      ],
    );
  }

  Widget _reportPolicyText(String text) {
    return Text(
      text,
      style:
          AppStyle.body14Regular.copyWith(color: AppColor.grey800, height: 1.5),
    );
  }
}
