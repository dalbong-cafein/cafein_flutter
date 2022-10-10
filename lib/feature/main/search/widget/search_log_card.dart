import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchLogCard extends StatelessWidget {
  const SearchLogCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text("최근 검색어", style: AppStyle.subTitle14Medium),
              const Spacer(),
              InkWell(
                onTap: () {
                  //전체 삭제 버튼
                },
                child: Text("전체 삭제",
                    style: AppStyle.caption13Medium
                        .copyWith(color: AppColor.grey500)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return searchLogItem("검색어", "05.31", true);
            })
      ],
    );
  }

  Widget searchLogItem(String logText, String logDate, bool isHeart) {
    return Column(
      children: [
        Container(height: 1.0, width: 1000, color: AppColor.grey100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              isHeart
                  ? loadAsset(AppIcon.heartS, color: AppColor.orange400)
                  : loadAsset(AppIcon.search,
                      color: AppColor.grey600, width: 16, height: 16),
              const Spacer(
                flex: 1,
              ),
              Text(
                logText,
                style: AppStyle.body15Regular,
              ),
              const Spacer(
                flex: 15,
              ),
              Text(logDate,
                  style: AppStyle.caption12Regular
                      .copyWith(color: AppColor.grey300)),
              const Spacer(
                flex: 1,
              ),
              loadAsset(AppIcon.clear24S, color: AppColor.grey300)
            ],
          ),
        ),
      ],
    );
  }
}
