import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';

class SearchEmptyResultCard extends StatelessWidget {
  const SearchEmptyResultCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loadAsset(
            AppImage.searchRunCharacter,
            width: 88,
            height: 80,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "카페 이름, 지하철, 지역 등으로 검색하세요",
            style: AppStyle.body14Regular.copyWith(
              color: AppColor.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
