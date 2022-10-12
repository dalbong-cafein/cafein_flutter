import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';

class SearchNoLogCard extends StatelessWidget {
  const SearchNoLogCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loadAsset(AppImage.noResult, width: 88, height: 80),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "카페 이름, 구, 역 등으로 검색하세요",
                style: AppStyle.body14Regular
                    .copyWith(color: AppColor.grey600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
