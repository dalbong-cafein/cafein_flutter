import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStickerWayBottomDrawer extends StatelessWidget {
  const GetStickerWayBottomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.only(top : 20),
            child: Row(
              children: [
                SizedBox(
                  width : width /2 ,
                  child: const Padding(
                    padding: EdgeInsets.only(left : 20),
                    child: Text(
                      "스티커 받는 방법",
                      style: AppStyle.title19Bold,
                    ),
                  ),
                ),
                SizedBox(
                    width : width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                                Icons.clear,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget getStickerSteps(String title, String content , bool isComment , String imageUrl){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
              title,
            style: AppStyle.subTitle17SemiBold.copyWith(
              color: AppColor.grey900
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            content,
            style: AppStyle.body14Regular,
          ),
          isComment? Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                "*카페 알림 전송을 위해 위치접근 권한을 허용해 주세요.",
                style: AppStyle.caption12Regular.copyWith(
                  color: AppColor.grey600
                ),
              )
            ],
          ) :const SizedBox.shrink(),
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
