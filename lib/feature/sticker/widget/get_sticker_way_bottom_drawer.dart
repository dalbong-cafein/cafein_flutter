import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class GetStickerWayBottomDrawer extends StatelessWidget {
  const GetStickerWayBottomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return SizedBox(
      height: bottomPadding > 0 ? height * 0.7 + bottomPadding : height * 0.7,
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: width / 2,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "스티커 받는 방법",
                        style: AppStyle.title19Bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: loadAsset(AppIcon.clear24S)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  getStickerSteps(
                      "1. 카페 혼잡도를 알려주세요",
                      "카페 근처로 가면 혼잡도 알림이 떠요.\n해당 카페의 혼잡도를 공유해 스티커를 받을 수 있어요.",
                      true,
                      AppImage.getStickerStep1),
                  const SizedBox(
                    height: 16,
                  ),
                  getStickerSteps(
                      "2. 카페 리뷰를 작성해 주세요",
                      "카페 상세페이지에서 추천도 버튼을 눌러 카페의 솔직한 리뷰를 남기면 스티커를 받을 수 있어요.",
                      false,
                      AppImage.getStickerStep2),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: width - 32,
                      margin: EdgeInsets.only(
                        bottom: bottomPadding > 0 ? bottomPadding + 16 : 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColor.grey400,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            "확인",
                            style: AppStyle.subTitle15Medium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getStickerSteps(
      String title, String content, bool isComment, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                AppStyle.subTitle17SemiBold.copyWith(color: AppColor.grey900),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            content,
            style: AppStyle.body14Regular,
          ),
          isComment
              ? Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "*카페 알림 전송을 위해 위치접근 권한을 허용해 주세요.",
                      style: AppStyle.caption12Regular
                          .copyWith(color: AppColor.grey600),
                    )
                  ],
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 16,
          ),
          loadAsset(
            imageUrl,
          )
        ],
      ),
    );
  }
}
