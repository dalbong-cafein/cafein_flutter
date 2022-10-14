import 'package:cafein_flutter/data/model/kakao/kakao_store_response.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class SearchStoreResultCard extends StatelessWidget {
  const SearchStoreResultCard({
    Key? key,
    required this.keyword,
    required this.store,
  }) : super(key: key);

  final String keyword;
  final KakaoStoreResponse store;

  @override
  Widget build(BuildContext context) {
    //TODO: 검색어 필드랑 일치하는 텍스트 처리 필요
    final storeName = store.placeName;

    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  keyword,
                  style: AppStyle.subTitle16Medium.copyWith(
                    color: AppColor.orange500,
                  ),
                ),
                Text(
                  storeName.replaceAll(keyword, ''),
                  style: AppStyle.subTitle16Medium,
                )
              ],
            ),
            Text(
              store.roadAddressName,
              style: AppStyle.caption13Regular.copyWith(
                color: AppColor.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
